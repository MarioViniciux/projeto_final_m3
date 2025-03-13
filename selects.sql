-- Total de acessibilidades dispostas em indicações de serviços

SELECT a.acessibilidade, COUNT(sa.id_novo_servico) AS total_servicos
FROM acessibilidade a
LEFT JOIN novo_servico_acessibilidade sa ON a.id = sa.id_acessibilidade

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

# Quantidade de indicações de serviços por categoria
SELECT c.categoria, COUNT(s.id) AS total_servicos
FROM categoria c
LEFT JOIN novo_servico s ON c.id = s.FK_categoria
GROUP BY c.categoria;

# Quantidade de serviços por bairro
SELECT bairro, COUNT(id) AS total_servicos
FROM servico
GROUP BY bairro
ORDER BY total_servicos DESC;

# Quantidade de indicações de serviços por bairro
SELECT bairro, COUNT(id) AS total_servicos
FROM novo_servico
GROUP BY bairro
ORDER BY total_servicos DESC;

# Quantidade de serviço por cidade
SELECT cidade, COUNT(id) AS total_servicos
FROM servico
GROUP BY cidade
ORDER BY total_servicos DESC;

# Quantidade de indicações de serviço por cidade
SELECT cidade, COUNT(id) AS total_servicos
FROM novo_servico
GROUP BY cidade
ORDER BY total_servicos DESC;

# Quantidade de serviços ativos e inativos
SELECT status, COUNT(id) AS total_servicos
FROM servico
GROUP BY status;

# Quantidade de indicações de serviços por status
SELECT status, COUNT(*) AS quantidade
FROM novo_servico
GROUP BY status;

# Total de acessibilidades dispostas em serviços
SELECT a.acessibilidade, COUNT(sa.id_servico) AS total_servicos
FROM acessibilidade a
LEFT JOIN servico_acessibilidade sa ON a.id = sa.id_acessibilidade
GROUP BY a.acessibilidade
ORDER BY total_servicos DESC;