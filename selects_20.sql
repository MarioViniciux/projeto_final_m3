# Top 5 serviços com maiores média 
SELECT s.nome, COALESCE(AVG(a.pontuacao), 0) AS media_pontuacao
FROM servico s
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY s.nome
ORDER BY media_pontuacao DESC
LIMIT 5;