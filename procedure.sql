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
  INSERT INTO avaliacao (feedback, pontuacao, data, FK_servico)
  SELECT feedback, pontuacao, data, FK_servico
  FROM avaliacao_temp
  WHERE browser_id = p_browser_id_avaliacao;

-- Após mover, deleta o registro de denuncia_temp
        DELETE FROM avaliacao_temp WHERE browser_id = p_browser_id_avaliacao;
    END IF;
END $$