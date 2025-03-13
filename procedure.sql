CALL salvar_novo_servico('1234')

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

END 