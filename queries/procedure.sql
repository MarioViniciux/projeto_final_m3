DELIMITER $$

CREATE PROCEDURE salvar_avaliacao(
    IN p_browser_id_avaliacao INT,
    IN p_pontuacao TINYINT,
    IN p_feedback TEXT,
    IN p_concluido BOOLEAN,
    IN p_fk_servico INT
)
BEGIN
    --Verificar se já existe um registro com o mesmo browser_id
    DECLARE v_exists INT;
    SET v_exists = (SELECT COUNT(*) FROM avaliacao_temp WHERE browser_id = p_browser_id_avaliacao);

    -- Se não existe, insere na tabela denuncia_temp
    IF v_exists = 0 THEN
        INSERT INTO avaliacao_temp (browser_id, pontuacao, feedback, concluido, fk_servico) 
        VALUES (p_browser_id_avaliacao, p_pontuacao, p_feedback, p_concluido, p_fk_servico);
    ELSE
        --Se já exixte, atualiza o registo na tabela denuncia_temp
        UPDATE avaliacao_temp
        SET feedback = p_feedback,
            pontuacao = p_pontuacao,
            concluido = p_concluido,
            fk_servico = p_fk_servico,
            updated_at = CURRENT_TIMESTAMP
            WHERE browser_id = p_browser_id_avaliacao;
    END IF;

    -- Se o registro estiver concluído, move os dados para a tabela denuncia
    IF p_concluido = TRUE THEN
    INSERT INTO avaliacao (feedback, pontuacao, data, fk_servico)
    SELECT feedback, pontuacao, data, FK_servico
    FROM avaliacao_temp
    WHERE browser_id = p_browser_id_avaliacao;

    -- Após mover, deleta o registro de denuncia_temp
    DELETE FROM avaliacao_temp WHERE browser_id = p_browser_id_avaliacao;
END IF;
END $$

CREATE PROCEDURE aprovar_servico(IN servicoID INT, IN adminID INT)
BEGIN
    DECLARE existe INT;
    DECLARE novoID INT;
    
    -- Verifica se o serviço existe e está pendente
    SELECT COUNT(*) INTO existe FROM novo_servico WHERE ID = servicoID AND status = 'pendente';
    IF existe = 1 THEN
        -- Move o serviço para a tabela Serviços
        INSERT INTO servico (fk_categoria, nome, funcionamento, requisitos, contato, descricao, cidade, bairro, rua, numero,CEP, created_at, updated_at)
        SELECT fk_categoria, nome, funcionamento, requisitos, contato, descricao, cidade, bairro, rua, numero, CEP, NOW(), NOW()
        FROM novo_servico WHERE ID = servicoID;
            
        SET novoID = LAST_INSERT_ID();
            
        INSERT INTO servico_acessibilidade (id_servico, id_acessibilidade)
        SELECT novoID, id_acessibilidade FROM novo_servico_acessibilidade WHERE id_novo_servico = servicoID;
            
        -- Atualiza o serviço como aprovado e registra o admin
        UPDATE novo_servico
        SET status = 'aprovado', FK_admin = adminID
        WHERE ID = servicoID;
    END IF;
END $$

CREATE PROCEDURE rejeitar_servico(IN servicoID INT, IN adminID INT)
BEGIN
    -- Apenas atualiza o status para 'rejeitado' e registra o admin responsável
    UPDATE novo_servico
    SET status = 'rejeitado', FK_admin = adminID
    WHERE ID = servicoID AND status = 'pendente';
END $$

CREATE PROCEDURE salvar_novo_servico(
    IN p_id INT,
    IN p_nome VARCHAR(50),
    IN p_contato VARCHAR(20),
    IN p_descricao TEXT,
    IN p_requisitos TEXT,
    IN p_funcionamento VARCHAR(20),
    IN p_rua VARCHAR(50),
    IN p_numero VARCHAR(10),
    IN p_bairro VARCHAR(50),
    IN p_cidade VARCHAR(50),
    IN p_cep VARCHAR(10),
    IN p_FK_categoria INT,
    IN p_acessibilidade TEXT,
    IN p_finalizar BOOLEAN
)
BEGIN
		DECLARE novoID INT;
    DECLARE acessibilidadeID INT;
    DECLARE posicao INT DEFAULT 1;
    DECLARE total INT;
    DECLARE tempAcessibilidade VARCHAR(255);
    
    IF p_acessibilidade = '' THEN 
			SET p_acessibilidade = '16'; 
    END IF;

    -- 1. Inserir ou atualizar os dados na tabela temporária
    INSERT INTO novo_servico_temp (id, nome, contato, descricao, requisitos, funcionamento, rua, numero, bairro, cidade, cep, acessibilidade, FK_categoria, updated_at)
    VALUES (p_id, p_nome, p_contato, p_descricao, p_requisitos, p_funcionamento, p_rua, p_numero, p_bairro, p_cidade, p_cep, p_acessibilidade, p_FK_categoria, NOW())
    ON DUPLICATE KEY UPDATE 
        nome = p_nome,
        contato = p_contato,
        descricao = p_descricao,
        requisitos = p_requisitos,
        funcionamento = p_funcionamento,
        rua = p_rua,
        numero = p_numero,
        bairro = p_bairro,
        cidade = p_cidade,
        cep = p_cep,
        acessibilidade = p_acessibilidade,
        FK_categoria = p_FK_categoria,
        updated_at = NOW();

    -- 2. Se o usuário finalizou o cadastro, mover para a tabela definitiva e remover da temporária
    IF p_finalizar = TRUE THEN
        INSERT INTO novo_servico (nome, contato, descricao, requisitos, funcionamento, rua, numero, bairro, cidade, cep, FK_categoria)
        SELECT nome, contato, descricao, requisitos, funcionamento, rua, numero, bairro, cidade, cep, FK_categoria
        FROM novo_servico_temp
        WHERE id = p_id;
        
        SET novoID = LAST_INSERT_ID();
        
        SET total = CHAR_LENGTH(p_acessibilidade) - CHAR_LENGTH(REPLACE(p_acessibilidade, ',', '')) + 1;

				WHILE posicao <= total DO
					SET tempAcessibilidade = SUBSTRING_INDEX(SUBSTRING_INDEX(p_acessibilidade, ',', posicao), ',', -1);
					SET acessibilidadeID = CAST(tempAcessibilidade AS UNSIGNED);
		            
		      INSERT INTO novo_servico_acessibilidade(id_novo_servico, id_acessibilidade)
		      VALUES (novoID, acessibilidadeID);
		            
		      SET posicao = posicao + 1;
				END WHILE;
        
        DELETE FROM novo_servico_temp WHERE id = p_id;
    END IF;
END $$

CREATE PROCEDURE remover_servico_com_muita_denuncia()
BEGIN
	-- Remover serviços que tenham mais de 40 denúncias
	DELETE FROM servico
	WHERE id IN (
	SELECT id FROM (
	SELECT s.id
	FROM servico s
	JOIN denuncia d ON s.id = d.FK_servico
	GROUP BY s.id
	HAVING COUNT(d.id) > 40
	) AS subquery

	-- As denúncias são removidas automaticamente devido ao ON DELETE CASCADE
);

END $$

CREATE PROCEDURE salvar_denuncia(
    IN p_browser_id_denuncia INT,
    IN p_feedback TEXT,
    IN p_concluido BOOLEAN,
    IN p_fk_servico INT
)
BEGIN
    -- Verifica se já existe um registro com o mesmo browser_id
    DECLARE v_exists INT;
    SET v_exists = (SELECT COUNT(*) FROM denuncia_temp WHERE browser_id = p_browser_id_denuncia);
    
    -- Se não existe, insere na tabela denuncia_temp
    IF v_exists = 0 THEN
        INSERT INTO denuncia_temp (browser_id, feedback, concluido, FK_servico) 
        VALUES (p_browser_id_denuncia, p_feedback, p_concluido, p_fk_servico);
    ELSE
        -- Se já existe, atualiza o registro na tabela denuncia_temp
        UPDATE denuncia_temp 
        SET feedback = p_feedback, 
            concluido = p_concluido, 
            FK_servico = p_fk_servico, 
            updated_at = CURRENT_TIMESTAMP
        WHERE browser_id = p_browser_id_denuncia;
    END IF;
    
    -- Se o registro estiver concluído, move os dados para a tabela denuncia
    IF p_concluido = TRUE THEN
        INSERT INTO denuncia (feedback, data, FK_servico)
        SELECT feedback, data, FK_servico
        FROM denuncia_temp
        WHERE browser_id = p_browser_id_denuncia;
        
        -- Após mover, deleta o registro de denuncia_temp
        DELETE FROM denuncia_temp WHERE browser_id = p_browser_id_denuncia;
    END IF;
END $$

DELIMITER ;