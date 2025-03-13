# Cidades que possuem serviços que possuem as maiores médias de serviço (em ordem descrescente)
SELECT s.cidade, COALESCE(AVG(a.pontuacao), 0) AS media_avaliacoes
FROM servico s
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY s.cidade
ORDER BY media_avaliacoes DESC;