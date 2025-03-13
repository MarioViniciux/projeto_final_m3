CREATE EVENT IF NOT EXISTS remover_servico
ON SCHEDULE EVERY 1 DAY
DO CALL remover_servico_com_muita_denuncia();