# Total de indicações de serviços que possuem alguma acessibilidade ou nenhuma acessibilidade
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM novo_servico_acessibilidade sa WHERE sa.id_novo_servico = s.id) 
        THEN 'Com Acessibilidade' 
        ELSE 'Sem Acessibilidade' 
    END AS tipo,
    COUNT(s.id) AS total
FROM novo_servico s
GROUP BY tipo;