# Quantidade total da pontuação 
SELECT pontuacao, COUNT(id) AS total_avaliacoes
FROM avaliacao
GROUP BY pontuacao
ORDER BY pontuacao ASC;