DELIMITER $$

CREATE EVENT IF NOT EXISTS remover_servico
ON SCHEDULE EVERY 1 DAY
DO CALL remover_servico_com_muita_denuncia();

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

DELIMITER ;;