-- Total de avaliações por categoria

SELECT c.categoria, COALESCE(AVG(a.pontuacao), 0) AS media_pontuacao
FROM categoria c
LEFT JOIN servico s ON c.id = s.FK_categoria
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY c.categoria
ORDER BY media_pontuacao DESC;