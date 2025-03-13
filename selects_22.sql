# Proporção de serviços disponibilizados vs serviços sugeridos
SELECT 'Novo Serviço' AS tipo, COUNT(id) AS total FROM novo_servico
UNION ALL
SELECT 'Serviço Ativo', COUNT(id) FROM servico WHERE status = 'Ativo';