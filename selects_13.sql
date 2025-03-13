-- Total de avaliações que cada serviço possui

SELECT s.nome, COUNT(a.id) AS total_avaliacoes
FROM servico s
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY s.nome
ORDER BY total_avaliacoes DESC;