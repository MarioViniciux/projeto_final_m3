-- Total de denuncias que cada serviço possui

SELECT s.nome, COUNT(d.id) AS total_denuncias
FROM servico s
LEFT JOIN denuncia d ON s.id = d.FK_servico
GROUP BY s.nome
ORDER BY total_denuncias DESC;