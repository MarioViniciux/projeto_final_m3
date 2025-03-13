-- Total de acessibilidades dispostas em indicações de serviços
SELECT a.acessibilidade, COUNT(sa.id_novo_servico) AS total_servicos
FROM acessibilidade a
LEFT JOIN novo_servico_acessibilidade sa ON a.id = sa.id_acessibilidade
GROUP BY a.acessibilidade
ORDER BY total_servicos DESC;

-- Total de avaliações que cada serviço possui
SELECT s.nome, COUNT(a.id) AS total_avaliacoes
FROM servico s
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY s.nome
ORDER BY total_avaliacoes DESC;

-- Média de avaliações por categoria
SELECT c.categoria, COALESCE(AVG(a.pontuacao), 0) AS media_pontuacao
FROM categoria c
LEFT JOIN servico s ON c.id = s.FK_categoria
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY c.categoria
ORDER BY media_pontuacao DESC;

-- Total de denuncias que cada serviço possui
SELECT s.nome, COUNT(d.id) AS total_denuncias
FROM servico s
LEFT JOIN denuncia d ON s.id = d.FK_servico
GROUP BY s.nome
ORDER BY total_denuncias DESC;

# Total de serviços que possuem alguma acessibilidade ou nenhuma acessibilidade
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM servico_acessibilidade sa WHERE sa.id_servico = s.id AND id_acessibilidade != 16) 
        THEN 'Com Acessibilidade' 
        ELSE 'Sem Acessibilidade' 
    END AS tipo,
    COUNT(s.id) AS total
FROM servico s
GROUP BY tipo;

# Total de indicações de serviços que possuem alguma acessibilidade ou nenhuma acessibilidade
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM novo_servico_acessibilidade sa WHERE sa.id_novo_servico = s.id AND id_acessibilidade != 16) 
        THEN 'Com Acessibilidade' 
        ELSE 'Sem Acessibilidade' 
    END AS tipo,
    COUNT(s.id) AS total
FROM novo_servico s
GROUP BY tipo;

# Quantidade total da pontuação 
SELECT pontuacao, COUNT(id) AS total_avaliacoes
FROM avaliacao
GROUP BY pontuacao
ORDER BY pontuacao ASC;

# Cidades que possuem serviços que possuem as maiores médias de serviço (em ordem descrescente)
SELECT s.cidade, COALESCE(AVG(a.pontuacao), 0) AS media_avaliacoes
FROM servico s
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY s.cidade
ORDER BY media_avaliacoes DESC;

# Top 5 serviços com maiores média 
SELECT s.nome, COALESCE(AVG(a.pontuacao), 0) AS media_pontuacao
FROM servico s
LEFT JOIN avaliacao a ON s.id = a.FK_servico
GROUP BY s.nome
ORDER BY media_pontuacao DESC
LIMIT 5;

# Categoria com mais números de denuncia
SELECT c.categoria, COUNT(d.id) AS total_denuncias
FROM categoria c
LEFT JOIN servico s ON c.id = s.FK_categoria
LEFT JOIN denuncia d ON s.id = d.FK_servico
GROUP BY c.categoria
ORDER BY total_denuncias DESC;

# Proporção de serviços disponibilizados vs serviços sugeridos
SELECT 'Novo Serviço' AS tipo, COUNT(id) AS total FROM novo_servico
UNION ALL
SELECT 'Serviço Ativo', COUNT(id) FROM servico WHERE status = 'ativo';

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

# Serviços acima e abaixa da média
SELECT 
    SUM(CASE WHEN pontuacao >= 3 THEN 1 ELSE 0 END) AS acima_media,
    SUM(CASE WHEN pontuacao < 3 THEN 1 ELSE 0 END) AS abaixo_media
FROM avaliacao;

# Serviços denunciados e não denunciados
SELECT 
    (SELECT COUNT(DISTINCT FK_servico) FROM denuncia) AS denunciados,
    (SELECT COUNT(id) FROM servico) - (SELECT COUNT(DISTINCT FK_servico) FROM denuncia) AS nao_denunciados;

# Admins que mais aprovaram serviços
SELECT a.nome, COUNT(n.id) AS total_aprovacoes
FROM admin a
JOIN novo_servico n ON a.id = n.FK_admin
WHERE n.status = 'aprovado'
GROUP BY a.nome
ORDER BY total_aprovacoes DESC;

# Admins que mais atuam (seja aprovando ou rejeitando)
SELECT a.nome, COUNT(n.id) AS total_servicos
FROM admin a
JOIN novo_servico n ON a.id = n.FK_admin
GROUP BY a.nome;
