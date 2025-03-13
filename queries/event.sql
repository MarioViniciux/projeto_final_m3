DELIMITER $$

CREATE EVENT IF NOT EXISTS remover_servico
ON SCHEDULE EVERY 1 DAY
DO  
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

CREATE EVENT IF NOT EXISTS remover_servico_incompleto
ON SCHEDULE EVERY 10 MINUTE
DO
BEGIN
    DELETE FROM novo_servico_temp WHERE updated_at < (NOW() - INTERVAL 15 MINUTE);
END $$

CREATE EVENT IF NOT EXISTS remover_denuncia_incompleta
ON SCHEDULE EVERY 10 MINUTE
DO
BEGIN
    DELETE FROM denuncia_temp WHERE updated_at < (NOW() - INTERVAL 15 MINUTE);
END $$

CREATE EVENT IF NOT EXISTS remover_avaliacao_incompleta
ON SCHEDULE EVERY 10 MINUTE
DO
BEGIN
    DELETE FROM avaliacao_temp WHERE updated_at < (NOW() - INTERVAL 15 MINUTE);
END $$

DELIMITER ;