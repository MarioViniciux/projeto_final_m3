-- Total de acessibilidades dispostas em indicações de serviços

SELECT a.acessibilidade, COUNT(sa.id_novo_servico) AS total_servicos
FROM acessibilidade a
LEFT JOIN novo_servico_acessibilidade sa ON a.id = sa.id_acessibilidade
GROUP BY a.acessibilidade
ORDER BY total_servicos DESC;