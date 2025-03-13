# Categoria com mais números de denuncia
SELECT c.categoria, COUNT(d.id) AS total_denuncias
FROM categoria c
LEFT JOIN servico s ON c.id = s.FK_categoria
LEFT JOIN denuncia d ON s.id = d.FK_servico
GROUP BY c.categoria
ORDER BY total_denuncias DESC;