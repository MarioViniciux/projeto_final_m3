# Todos os serviços com principais informações ao lado 
SELECT 
    s.nome AS servico, 
    s.contato AS contato,
    s.descricao AS descricao,
    s.funcionamento AS horario,
    s.requisitos AS requerimentos,
    s.status AS funcionando,
    GROUP_CONCAT(a.acessibilidade SEPARATOR ', ') AS acessibilidades,
    CONCAT(s.rua, ', ', s.numero, ',', s.bairro, ', ', s.cidade, ' - ', s.cep) AS endereco
FROM servico s
JOIN servico_acessibilidade sa ON s.id = sa.id_servico
JOIN acessibilidade a ON sa.id_acessibilidade = a.id
GROUP BY s.id;


# Todos as indicações de serviços com principais informações ao lado 
SELECT 
    s.nome AS servico, 
    s.contato AS contato,
    s.descricao AS descricao,
    s.funcionamento AS horario,
    s.requisitos AS requerimentos,
    s.status AS funcionando,
    GROUP_CONCAT(a.acessibilidade SEPARATOR ', ') AS acessibilidades,
    CONCAT(s.rua, ', ', s.numero, ', ', s.bairro, ', ', s.cidade, ' - ', s.cep) AS endereco
FROM novo_servico s
JOIN novo_servico_acessibilidade sa ON s.id = sa.id_novo_servico
JOIN acessibilidade a ON sa.id_acessibilidade = a.id
GROUP BY s.id;


# Quantidade de serviços por categoria
SELECT c.categoria, COUNT(s.id) AS total_servicos
FROM categoria c
LEFT JOIN servico s ON c.id = s.FK_categoria
GROUP BY c.categoria;