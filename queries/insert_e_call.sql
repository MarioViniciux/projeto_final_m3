# Criando admins
INSERT INTO admin(nome, email, senha) 
VALUES 
    ("Admin1", "admin1@admin.com", "admin1"),
    ("Admin2", "admin2@admin.com", "admin2"),
    ("Admin3", "admin3@admin.com", "admin3"),
    ("Admin4", "admin4@admin.com", "admin4"),
    ("Admin5", "admin5@admin.com", "admin5");

# Criando tipos de categoria
INSERT INTO categoria (categoria)
VALUES 
    ('Saúde'),
    ('Esporte'),
    ('Educação'),
    ('Transporte'),
    ('Lazer'),
    ('Alimentação'),
    ('Tecnologia'),
    ('Turismo'),
    ('Segurança'),
    ('Habitação'),
    ('Nenhuma');

# Criando tipos de acessibilidade
INSERT INTO acessibilidade (acessibilidade)
VALUES 
    ('Física'),
    ('Intelectual'),
    ('Visual'),
    ('Auditiva'),
    ('Nanismo'),
    ('Autismo'),
    ('Mental'),
    ('Múltipla'),
    ('Mobilidade Reduzida'),
    ('Deficiência Motora'),
    ('Surdocegueira'),
    ('Transtorno do Déficit de Atenção'),
    ('Doenças Neuromusculares'),
    ('Deficiência Psicossocial'),
    ('Deficiência Cognitiva');

### Exemplo de chamada da procedure
### (ID do serviço a ser salvo, nome, contato, descrição, requisitos, horario de funcionamento, rua, bairro, cidade, cep, chave estrangeira da categoria, acessibilidades e se está finalizado ou não)
### Para o caso de nenhuma acessibilidade, apenas coloque ''; Para o caso de um serviço que funcione todos os dias, coloque por exemplo: 'Seg-Seg 8hr-20hr'; Para o caso de um serviço 24 horas, coloque: '24hr'
# CALL salvar_novo_servico(1, 'Segundo teste', '(DDD)99342-9999', 'Desc', 'Requs', 'Dia-Dia 00h-00h', 'Rua B', 'numero do local', 'Bairro C', 'Cidade D', '12345-987', 2, "1, 2, 3, 6", TRUE); -- (TRUE) Insere dados direto em novo_servico
# CALL salvar_novo_servico(1, 'Segundo teste', '(DDD)99342-9999', 'Desc', 'Requs', 'Dia-Dia 00h-00h', 'Rua B', 'Bairro C', 'Cidade D', '12345-987', 2, "1, 2, 3, 6", FALSE); -- (FALSE) Insere dados em novo_servico_tempo

# Criando dados na tabela novo_servico_temp
CALL salvar_novo_servico(1, 'Atendimento Médico Popular', '(11)91234-5678', 'Consultas médicas gratuitas para a comunidade.', 'Documento de identidade e comprovante de residência.', 'Seg-Sex 08h-17h', 'Rua da Saúde','123', 'Centro', 'São Paulo', '01000-000', 1, '1,2,3', FALSE);
CALL salvar_novo_servico(2, 'Aula de Yoga ao Ar Livre', '(21)92345-6789', 'Sessões semanais de yoga para todas as idades.', 'Roupas confortáveis.', 'Sáb-Dom 07h-09h', 'Parque das Flores', '31','Jardins', 'Rio de Janeiro', '22000-000', 2, '2,5,6', FALSE);
CALL salvar_novo_servico(3, 'Reforço Escolar Comunitário', '(31)93456-7890', 'Aulas gratuitas para alunos do ensino fundamental.', 'Material escolar.', 'Seg-Sex 14h-18h', 'Rua do Saber', '456', 'Bela Vista', 'Belo Horizonte', '30000-000', 3, '1,4,7', FALSE);
CALL salvar_novo_servico(4, 'Transporte Solidário', '(41)94567-8901', 'Transporte gratuito para idosos e PCDs.', 'Cadastro prévio.', 'Seg-Sex 08h-18h', 'Av. Mobilidade', '789', 'Vila Nova', 'Curitiba', '80000-000', 4, '3,6,9', FALSE);
CALL salvar_novo_servico(5, 'Biblioteca Itinerante', '(51)95678-9012', 'Empréstimo de livros gratuitos em comunidades.', 'Cadastro no programa.', 'Seg-Sex 09h-17h', 'Praça do Conhecimento', '312', 'Cidade Baixa', 'Porto Alegre', '90000-000', 3, '1,4,5', FALSE);
CALL salvar_novo_servico(6, 'Aulas de Natação para Crianças', '(61)96789-0123', 'Ensino gratuito de natação para crianças.', 'Roupa de banho.', 'Ter-Qui 10h-12h', 'Rua das Águas', '421', 'Taguatinga', 'Brasília', '70000-000', 2, '2,5,8', FALSE);
CALL salvar_novo_servico(7, 'Distribuição de Alimentos', '(71)97890-1234', 'Entrega semanal de cestas básicas.', 'Comprovante de baixa renda.', 'Sáb-Dom 08h-12h', 'Rua das Centelha', '416', 'Liberdade', 'Salvador', '40000-000', 6, '3,7,9', FALSE);
CALL salvar_novo_servico(8, 'Apoio Psicológico Gratuito', '(81)98901-2345', 'Sessões de terapia para jovens e adultos.', 'Cadastro prévio.', 'Seg-Sex 09h-17h', 'Rua da Esperança', '50', 'Boa Viagem', 'Recife', '50000-000', 1, '1,2,3', FALSE);
CALL salvar_novo_servico(9, 'Aulas de Programação para Jovens', '(91)99012-3456', 'Curso de lógica de programação e JavaScript.', 'Notebook ou celular.', 'Seg-Sex 14h-18h', 'Rua da Centopeia', '953', 'Umarizal', 'Belém', '66000-000', 7, '1,4,7', FALSE);
CALL salvar_novo_servico(10, 'Passeios Guiados pela Cidade', '(11)90123-4567', 'Visitas a pontos turísticos locais com guias voluntários.', 'Agendamento prévio.', 'Sáb-Dom 10h-16h', 'Praça Central', '352', 'República', 'São Paulo', '01010-000', 8, '2,5,8', FALSE);
CALL salvar_novo_servico(11, 'Segurança Comunitária', '(21)91234-5678', 'Rondas noturnas e palestras sobre segurança.', 'Participação em reuniões.', 'Seg-Sex 19h-22h', 'Rua da Seda', '52', 'Copacabana', 'Rio de Janeiro', '22020-000', 9, '3,6,9', FALSE);
CALL salvar_novo_servico(12, 'Moradia Temporária', '(31)92345-6789', 'Abrigo temporário para famílias em vulnerabilidade.', 'Cadastro social.', 'Seg-Seg 24h', 'Cerco', '12', 'Santa Tereza', 'Belo Horizonte', '31000-000', 10, '1,4,7', FALSE);
CALL salvar_novo_servico(13, 'Ginástica para Idosos', '(41)93456-7890', 'Atividades físicas adaptadas para terceira idade.', 'Roupas confortáveis.', 'Seg-Sex 08h-10h', 'Parque Municipal', '832', 'Água Verde', 'Curitiba', '80500-000', 2, '2,5,6', FALSE);
CALL salvar_novo_servico(14, 'Ciclismo Comunitário', '(51)94567-8901', 'Empréstimo gratuito de bicicletas.', 'Cadastro e documento.', 'Seg-Sex 07h-19h', 'Estação Bike', '421', 'Menino Deus', 'Porto Alegre', '90100-000', 4, '2,6,8', FALSE);
CALL salvar_novo_servico(15, 'Almoço Solidário', '(61)95678-9012', 'Refeições gratuitas para moradores de rua.', 'Nenhum requisito.', 'Seg-Sex 11h-13h', 'Rua dos Jardins', '74', 'Ceilândia', 'Brasília', '72000-000', 6, '3,7,9', FALSE);
CALL salvar_novo_servico(16, 'Cursos Profissionalizantes', '(71)96789-0123', 'Cursos gratuitos em diversas áreas.', 'Ensino fundamental completo.', 'Seg-Sex 14h-18h', 'Rua Dom Pedro', '31', 'Comércio', 'Salvador', '40010-000', 7, '1,4,7', FALSE);
CALL salvar_novo_servico(17, 'Wi-Fi Livre na Praça', '(81)97890-1234', 'Internet gratuita em praças públicas.', 'Nenhum requisito.', 'Seg-Seg 06h-22h', 'Rua do Pratos', '39', 'Pina', 'Recife', '51100-000', 7, '2,5,8', FALSE);
CALL salvar_novo_servico(18, 'Apoio Jurídico Gratuito', '(91)98901-2345', 'Atendimento jurídico para pessoas de baixa renda.', 'Agendamento prévio.', 'Seg-Sex 09h-17h', 'Aves', '74', 'Reduto', 'Belém', '66010-000', 9, '3,6,9', FALSE);
CALL salvar_novo_servico(19, 'Passeios para Crianças', '(11)99012-3456', 'Excursões para crianças de baixa renda.', 'Autorização dos pais.', 'Sáb-Dom 08h-18h', 'Rua Amélia', '782', 'Brás', 'São Paulo', '03000-000', 8, '2,5,8', FALSE);
CALL salvar_novo_servico(20, 'Palestras sobre Moradia', '(21)90123-4567', 'Orientação para pessoas em busca de moradia social.', 'Cadastro prévio.', 'Seg-Sex 09h-17h', 'Rua Camoes', '23', 'Glória', 'Rio de Janeiro', '22200-000', 10, '1,4,7', FALSE);
CALL salvar_novo_servico(21, 'Atendimento Odontológico Comunitário', '(11)98765-4321', 'Consultas e pequenos procedimentos dentários gratuitos.', 'Documento de identidade.', 'Seg-Sex 08h-17h', 'Rua do Sorriso', '50', 'Centro', 'São Paulo', '01020-000', 1, '1,2,3', FALSE);
CALL salvar_novo_servico(22, 'Treinamento Funcional ao Ar Livre', '(21)99876-5432', 'Exercícios físicos guiados por profissionais.', 'Roupas confortáveis.', 'Seg-Sex 06h-08h', 'Praia de Copacabana', '342', 'Copacabana', 'Rio de Janeiro', '22030-000', 2, '2,5,6', FALSE);
CALL salvar_novo_servico(23, 'Oficina de Redação para ENEM', '(31)90987-6543', 'Aulas de redação para vestibulandos.', 'Caderno e caneta.', 'Seg-Sex 14h-18h', 'Rua Maria Lurdes', '318', 'Savassi', 'Belo Horizonte', '30100-000', 3, '1,4,7', FALSE);
CALL salvar_novo_servico(24, 'Transporte Escolar Gratuito', '(41)92098-7654', 'Transporte para alunos da rede pública.', 'Cadastro na escola.', 'Seg-Sex 06h-19h', 'Av. das Escolas', '424', 'Portão', 'Curitiba', '80040-000', 4, '3,6,9', FALSE);
CALL salvar_novo_servico(25, 'Cinema ao Ar Livre', '(51)93109-8765', 'Sessões gratuitas de filmes em praças públicas.', 'Nenhum requisito.', 'Sáb-Dom 19h-22h', 'Praça da Cultura', '743', 'Cidade Baixa', 'Porto Alegre', '90040-000', 5, '2,5,8', FALSE);
CALL salvar_novo_servico(26, 'Distribuição de Sopa Noturna', '(61)94210-9876', 'Refeições quentes para moradores de rua.', 'Nenhum requisito.', 'Seg-Sex 20h-22h', 'Rua do Castelo', '341', 'Taguatinga', 'Brasília', '70040-000', 6, '3,7,9', FALSE);
CALL salvar_novo_servico(27, 'Workshop de Cibersegurança', '(71)95321-0987', 'Aulas sobre segurança digital e proteção de dados.', 'Notebook ou celular.', 'Seg-Sex 14h-18h', 'Rua da Lua Vermelha', '23', 'Barra', 'Salvador', '40040-000', 7, '1,4,7', FALSE);
CALL salvar_novo_servico(28, 'Passeios Culturais para Idosos', '(81)96432-1098', 'Excursões gratuitas para museus e teatros.', 'Cadastro prévio.', 'Sáb-Dom 09h-16h', 'Rua das Acácias', '346', 'Boa Viagem', 'Recife', '50040-000', 8, '2,5,8', FALSE);
CALL salvar_novo_servico(29, 'Curso de Defesa Pessoal Feminina', '(91)97543-2109', 'Aulas práticas de autodefesa para mulheres.', 'Roupas confortáveis.', 'Seg-Sex 18h-20h', 'Rua do Paraná', '32', 'Umarizal', 'Belém', '66040-000', 9, '3,6,9', FALSE);
CALL salvar_novo_servico(30, 'Feira de Moradia Popular', '(11)98654-3210', 'Orientação sobre programas habitacionais.', 'Cadastro prévio.', 'Seg-Sex 09h-17h', 'Rua da Associação', '321', 'Santana', 'São Paulo', '01050-000', 10, '1,4,7', FALSE);
CALL salvar_novo_servico(31, 'Atendimento Nutricional Gratuito', '(21)99765-4321', 'Avaliação nutricional e dicas de alimentação saudável.', 'Cadastro prévio.', 'Seg-Sex 08h-17h', 'Rua Populosa', '85', 'Glória', 'Rio de Janeiro', '22050-000', 1, '1,2,3', FALSE);
CALL salvar_novo_servico(32, 'Aulas de Capoeira para Jovens', '(31)90876-5432', 'Ensino gratuito de capoeira para crianças e adolescentes.', 'Roupas leves.', 'Seg-Sex 10h-12h', 'Rua Esportiva', '953', 'Pampulha', 'Belo Horizonte', '30150-000', 2, '2,5,6', FALSE);
CALL salvar_novo_servico(33, 'Curso de Inglês Básico', '(41)91987-6543', 'Aulas de inglês para iniciantes.', 'Material didático fornecido.', 'Seg-Sex 14h-18h', 'Rua da Lingua', '100', 'Batel', 'Curitiba', '80050-000', 3, '1,4,7', FALSE);
CALL salvar_novo_servico(34, 'Transporte para Consultas Médicas', '(51)92098-7654', 'Carona solidária para consultas e exames.', 'Cadastro prévio.', 'Seg-Sex 07h-18h', 'Av. da Saúde', '41', 'Moinhos de Vento', 'Porto Alegre', '90050-000', 4, '3,6,9', FALSE);
CALL salvar_novo_servico(35, 'Festival de Música Comunitário', '(61)93109-8765', 'Shows gratuitos com bandas locais.', 'Nenhum requisito.', 'Sáb-Dom 18h-23h', 'Rua das Artes', '42', 'Asa Sul', 'Brasília', '70050-000', 5, '2,5,8', FALSE);
CALL salvar_novo_servico(36, 'Café da Manhã Solidário', '(71)94210-9876', 'Distribuição de café da manhã para a população vulnerável.', 'Nenhum requisito.', 'Seg-Sex 06h-08h', 'Rua do Socialismo', '11', 'Comércio', 'Salvador', '40050-000', 6, '3,7,9', FALSE);
CALL salvar_novo_servico(37, 'Aulas de Programação para Idosos', '(81)95321-0987', 'Introdução à tecnologia para a terceira idade.', 'Celular ou notebook.', 'Seg-Sex 14h-16h', 'Rua das Águas', '32', 'Pina', 'Recife', '50050-000', 7, '1,4,7', FALSE);
CALL salvar_novo_servico(38, 'Passeios Fotográficos pela Cidade', '(91)96432-1098', 'Caminhadas fotográficas para iniciantes.', 'Câmera ou celular.', 'Sáb-Dom 09h-12h', 'Rua do Pontinho', '425', 'Cidade Velha', 'Belém', '66050-000', 8, '2,5,8', FALSE);
CALL salvar_novo_servico(39, 'Monitoramento Comunitário', '(11)97543-2109', 'Projeto de segurança comunitária com voluntários.', 'Participação ativa.', 'Seg-Sex 19h-22h', 'Rua dq Seda', '765', 'Santana', 'São Paulo', '01060-000', 9, '3,6,9', FALSE);
CALL salvar_novo_servico(40, 'Mutirão de Regularização Fundiária', '(21)98654-3210', 'Orientação sobre documentos para regularizar moradias.', 'Cadastro na prefeitura.', 'Seg-Sex 09h-17h', 'Rua da Pina', '423', 'Laranjeiras', 'Rio de Janeiro', '22060-000', 10, '1,4,7', FALSE);
CALL salvar_novo_servico(41, 'Atendimento Fisioterapêutico', '(11)91234-1111', 'Sessões gratuitas de fisioterapia para reabilitação.', 'Laudo médico.', 'Seg-Sex 08h-17h', 'Rua da Regata', '100', 'Centro', 'São Paulo', '01100-000', 1, '1,2,3', FALSE);
CALL salvar_novo_servico(42, 'Treino de Corrida Comunitário', '(21)92345-2222', 'Grupo de corrida para iniciantes e amadores.', 'Roupas esportivas.', 'Seg-Sex 06h-07h', 'Parque do Povo', '952', 'Botafogo', 'Rio de Janeiro', '22100-000', 2, '2,5,6', FALSE);
CALL salvar_novo_servico(43, 'Aulas de Matemática para Vestibular', '(31)93456-3333', 'Reforço de matemática para quem vai prestar vestibular.', 'Caderno e lápis.', 'Seg-Sex 14h-18h', 'Rua da Glória', '635', 'Savassi', 'Belo Horizonte', '31010-000', 3, '1,4,7', FALSE);
CALL salvar_novo_servico(44, 'Bicicletas Compartilhadas', '(41)94567-4444', 'Empréstimo gratuito de bicicletas para mobilidade urbana.', 'Cadastro com documento.', 'Seg-Sex 07h-19h', 'Rua do Ciclismo', '753', 'Centro', 'Curitiba', '80100-000', 4, '2,6,8', FALSE);
CALL salvar_novo_servico(45, 'Apresentações Teatrais Gratuitas', '(51)95678-5555', 'Peças teatrais abertas ao público.', 'Nenhum requisito.', 'Sáb-Dom 18h-21h', 'Rua da Cultura', '75', 'Cidade Baixa', 'Porto Alegre', '90110-000', 5, '2,5,8', FALSE);
CALL salvar_novo_servico(46, 'Cozinha Comunitária', '(61)96789-6666', 'Almoço gratuito para pessoas em situação de vulnerabilidade.', 'Nenhum requisito.', 'Seg-Sex 11h-13h', 'Rua do Acolhimento', '363', 'Asa Norte', 'Brasília', '70100-000', 6, '3,7,9', FALSE);
CALL salvar_novo_servico(47, 'Curso de Manutenção de Computadores', '(71)97890-7777', 'Ensino gratuito de conserto e montagem de computadores.', 'Nenhum requisito.', 'Seg-Sex 14h-18h', 'Rua do Mirtilo', '234', 'Barra', 'Salvador', '40100-000', 7, '1,4,7', FALSE);
CALL salvar_novo_servico(48, 'Tour Histórico Guiado', '(81)98901-8888', 'Passeios históricos guiados por voluntários.', 'Agendamento prévio.', 'Sáb-Dom 09h-12h', 'Rua do Papagaio', '452', 'Recife Antigo', 'Recife', '50100-000', 8, '2,5,8', FALSE);
CALL salvar_novo_servico(49, 'Patrulha Solidária', '(91)99012-9999', 'Monitoramento comunitário e apoio em segurança.', 'Participação em reuniões.', 'Seg-Sex 19h-22h', 'Rua do Frevo', '312', 'Umarizal', 'Belém', '66100-000', 9, '3,6,9', FALSE);
CALL salvar_novo_servico(50, 'Projeto Casa Segura', '(11)90123-0000', 'Consultoria gratuita sobre segurança residencial.', 'Cadastro prévio.', 'Seg-Sex 09h-17h', 'Rua do Ligeiro', '647', 'Santana', 'São Paulo', '01200-000', 10, '1,4,7', FALSE);

# Criando dados na tabela novo_servico
CALL salvar_novo_servico(1, 'Clínica Popular Gratuita', '(11)92345-1111', 'Consultas médicas gratuitas para baixa renda.', 'Documento com foto e comprovante de residência.', 'Seg-Sex 08h-17h', 'Rua Esperança Solidária', '101', 'Centro', 'São Paulo', '01010-000', 1, '1,2,3', TRUE);
CALL salvar_novo_servico(2, 'Aulas de Pilates Comunitário', '(21)93456-2222', 'Sessões gratuitas de pilates para idosos.', 'Roupas confortáveis.', 'Ter-Qui 09h-10h', 'Rua Atlântica Livre', '150', 'Copacabana', 'Rio de Janeiro', '22040-000', 2, '2,5,6', TRUE);
CALL salvar_novo_servico(3, 'Curso de Alfabetização para Adultos', '(31)94567-3333', 'Ensino básico para jovens e adultos.', 'Nenhum requisito.', 'Seg-Sex 18h-20h', 'Rua do Saber', '200', 'Savassi', 'Belo Horizonte', '30130-000', 3, '1,4,7', TRUE);
CALL salvar_novo_servico(4, 'Transporte Gratuito para Pacientes', '(41)95678-4444', 'Carona solidária para hospitais e clínicas.', 'Cadastro prévio.', 'Seg-Sex 07h-19h', 'Rua Rodoviária Central', '50', 'Centro', 'Curitiba', '80020-000', 4, '3,6,9', TRUE);
CALL salvar_novo_servico(5, 'Cine Clube ao Ar Livre', '(51)96789-5555', 'Sessões de cinema gratuitas em espaços públicos.', 'Nenhum requisito.', 'Sáb-Dom 19h-22h', 'Rua Cultural Livre', '300', 'Cidade Baixa', 'Porto Alegre', '90030-000', 5, '2,5,8', TRUE);
CALL salvar_novo_servico(6, 'Cesta Básica Comunitária', '(61)97890-6666', 'Distribuição de alimentos para famílias carentes.', 'Cadastro prévio.', 'Seg-Sex 09h-12h', 'Rua Solidária', '400', 'Asa Norte', 'Brasília', '70120-000', 6, '3,7,9', TRUE);
CALL salvar_novo_servico(7, 'Curso de Introdução à Programação', '(71)98901-7777', 'Aulas básicas de lógica e desenvolvimento web.', 'Notebook ou celular.', 'Seg-Sex 14h-18h', 'Rua Tecnologia Livre', '150', 'Barra', 'Salvador', '40110-000', 7, '1,4,7', TRUE);
CALL salvar_novo_servico(8, 'Tour Cultural Gratuito', '(81)99012-8888', 'Passeios guiados por pontos turísticos da cidade.', 'Nenhum requisito.', 'Sáb-Dom 09h-12h', 'Rua dos Turistas', '210', 'Recife Antigo', 'Recife', '50060-000', 8, '2,5,8', TRUE);
CALL salvar_novo_servico(9, 'Curso de Defesa Pessoal Feminina', '(91)90123-9999', 'Treinamento de autodefesa para mulheres.', 'Roupas confortáveis.', 'Seg-Sex 18h-20h', 'Rua Autodefesa', '130', 'Umarizal', 'Belém', '66060-000', 9, '3,6,9', TRUE);
CALL salvar_novo_servico(10, 'Mutirão de Habitação Social', '(11)91234-0000', 'Apoio para regularização de moradias populares.', 'Cadastro na prefeitura.', 'Seg-Sex 09h-17h', 'Rua Habitacional', '350', 'Santana', 'São Paulo', '01230-000', 10, '1,4,7', TRUE);
CALL salvar_novo_servico(11, 'Atendimento Odontológico Solidário', '(21)92345-1010', 'Consultas e tratamentos odontológicos gratuitos.', 'Comprovante de residência.', 'Seg-Sex 08h-17h', 'Rua Sorriso Solidário', '120', 'Tijuca', 'Rio de Janeiro', '22070-000', 1, '1,2,3', TRUE);
CALL salvar_novo_servico(12, 'Treino Funcional ao Ar Livre', '(31)93456-2020', 'Exercícios físicos orientados para todas as idades.', 'Roupas esportivas.', 'Ter-Qui 06h-07h', 'Rua Mangabeiras Fitness', '110', 'Mangabeiras', 'Belo Horizonte', '30160-000', 2, '2,5,6', TRUE);
CALL salvar_novo_servico(13, 'Curso de Espanhol Básico', '(41)94567-3030', 'Aulas introdutórias de língua espanhola.', 'Nenhum requisito.', 'Seg-Sex 14h-17h', 'Rua das Línguas', '250', 'Centro', 'Curitiba', '80050-000', 3, '1,4,7', TRUE);
CALL salvar_novo_servico(14, 'Bicicletário Comunitário', '(51)95678-4040', 'Empréstimo gratuito de bicicletas.', 'Cadastro com documento.', 'Seg-Sex 07h-19h', 'Rua Livre Bike', '500', 'Moinhos de Vento', 'Porto Alegre', '90050-000', 4, '2,6,8', TRUE);
CALL salvar_novo_servico(15, 'Festival de Arte de Rua', '(61)96789-5050', 'Apresentações de teatro, música e dança gratuitas.', 'Nenhum requisito.', 'Sáb-Dom 18h-23h', 'Rua das Artes', '600', 'Asa Sul', 'Brasília', '70150-000', 5, '2,5,8', TRUE);
CALL salvar_novo_servico(16, 'Distribuição de Café da Manhã Solidário', '(71)97890-6060', 'Café da manhã para pessoas em situação de rua.', 'Nenhum requisito.', 'Seg-Sex 06h-08h', 'Rua Acolhimento', '130', 'Pelourinho', 'Salvador', '40130-000', 6, '3,7,9', TRUE);
CALL salvar_novo_servico(17, 'Aulas de Robótica para Crianças', '(81)98901-7070', 'Ensino de conceitos básicos de robótica.', 'Nenhum requisito.', 'Seg-Sex 14h-16h', 'Rua Digital Infantil', '210', 'Boa Viagem', 'Recife', '50070-000', 7, '1,4,7', TRUE);
CALL salvar_novo_servico(18, 'Passeios Fotográficos Educativos', '(91)99012-8080', 'Caminhadas fotográficas por pontos históricos.', 'Câmera ou celular.', 'Sáb-Dom 09h-12h', 'Rua do Encontro Fotográfico', '150', 'Cidade Velha', 'Belém', '66080-000', 8, '2,5,8', TRUE);
CALL salvar_novo_servico(19, 'Ronda Comunitária', '(11)90123-9090', 'Monitoramento voluntário para segurança do bairro.', 'Participação ativa.', 'Seg-Sex 19h-22h', 'Rua de Vigilância', '250', 'Santana', 'São Paulo', '01240-000', 9, '3,6,9', TRUE);
CALL salvar_novo_servico(20, 'Orientação Jurídica para Moradia', '(21)91234-1011', 'Atendimento jurídico para regularização habitacional.', 'Cadastro na prefeitura.', 'Seg-Sex 09h-17h', 'Rua do Direito Habitacional', '180', 'Flamengo', 'Rio de Janeiro', '22080-000', 10, '1,4,7', TRUE);
CALL salvar_novo_servico(21, 'Consultoria Jurídica Voluntária', '(11)92345-1112', 'Aconselhamento jurídico gratuito para pequenas causas.', 'Documento de identidade e comprovante de residência.', 'Seg-Sex 09h-16h', 'Rua Justiça Solidária', '90', 'Vila Progredir', 'São Paulo', '01020-000', 1, '1,4,7', TRUE);
CALL salvar_novo_servico(22, 'Aulas de Música para Jovens', '(21)93456-2223', 'Aulas de violão, guitarra e teclado para iniciantes.', 'Instrumento musical ou material básico.', 'Seg-Sex 16h-18h', 'Rua das Artes Jovens', '500', 'Lapa', 'Rio de Janeiro', '20520-000', 2, '2,5,6', TRUE);
CALL salvar_novo_servico(23, 'Palestras sobre Sustentabilidade', '(31)94567-3334', 'Sessões educativas sobre consumo responsável.', 'Nenhum requisito.', 'Seg-Sex 10h-12h', 'Rua Ecológica', '100', 'Santa Efigênia', 'Belo Horizonte', '30140-000', 3, '3,6,9', TRUE);
CALL salvar_novo_servico(24, 'Grupo de Apoio a Pessoas com Deficiência', '(41)95678-4445', 'Encontros para troca de experiências e apoio mútuo.', 'Nenhum requisito.', 'Seg-Sex 09h-12h', 'Rua Inclusiva', '350', 'Centro', 'Curitiba', '80060-000', 4, '2,5,8', TRUE);
CALL salvar_novo_servico(25, 'Oficina de Confeitaria Criativa', '(51)96789-5556', 'Aulas de confeitaria e doces artesanais.', 'Material básico fornecido na oficina.', 'Sáb-Dom 14h-18h', 'Rua Doce Sabor', '620', 'Cidade Baixa', 'Porto Alegre', '90060-000', 5, '1,4,7', TRUE);
CALL salvar_novo_servico(26, 'Aulas de Culinária para Iniciantes', '(61)97890-7070', 'Aulas práticas de culinária básica.', 'Utensílios básicos fornecidos.', 'Seg-Sex 14h-16h', 'Rua Sabor e Vida', '110', 'Asa Norte', 'Brasília', '70130-000', 6, '2,4,8', TRUE);
CALL salvar_novo_servico(27, 'Treinamento de Capacitação para Jovens', '(71)98901-8181', 'Cursos de capacitação profissional gratuitos.', 'Nenhum requisito.', 'Seg-Sex 09h-12h', 'Rua da Oportunidade', '200', 'Avenida Paralela', 'Salvador', '40010-000', 7, '1,3,6', TRUE);
CALL salvar_novo_servico(28, 'Rede de Apoio a Imigrantes', '(81)99012-9292', 'Apoio psicossocial e jurídico para imigrantes.', 'Documentos migratórios.', 'Seg-Sex 10h-16h', 'Rua Solidariedade Internacional', '330', 'Boa Viagem', 'Recife', '50080-000', 8, '2,5,7', TRUE);
CALL salvar_novo_servico(29, 'Serviço de Orientação ao Trabalhador', '(91)90123-9494', 'Aconselhamento sobre direitos trabalhistas e previdenciários.', 'Comprovante de vínculo de trabalho.', 'Seg-Sex 09h-18h', 'Rua Trabalho Justo', '120', 'Cidade Nova', 'Belém', '66090-000', 9, '3,6,8', TRUE);
CALL salvar_novo_servico(30, 'Feira de Trocas Solidárias', '(11)91234-0606', 'Troca de produtos e objetos entre a comunidade.', 'Nenhum requisito.', 'Sáb-Dom 10h-14h', 'Rua da Troca', '200', 'Vila Madalena', 'São Paulo', '05020-000', 1, '2,4,9', TRUE);
CALL salvar_novo_servico(31, 'Consultoria para Empreendedores Locais', '(21)92345-0101', 'Apoio e consultoria para pequenos empreendedores.', 'Plano de negócios básico.', 'Seg-Sex 10h-17h', 'Rua Empreenda', '180', 'Centro', 'Rio de Janeiro', '20030-000', 2, '1,5,7', TRUE);
CALL salvar_novo_servico(32, 'Aulas de Fotografia para Iniciantes', '(31)93456-0102', 'Ensino de técnicas básicas de fotografia.', 'Câmera fotográfica ou celular.', 'Seg-Sex 14h-16h', 'Rua Imagem Perfeita', '90', 'Floresta', 'Belo Horizonte', '30150-000', 3, '2,5,9', TRUE);
CALL salvar_novo_servico(33, 'Grupo de Apoio para Pais', '(41)94567-2222', 'Encontros e apoio psicológico para pais de crianças pequenas.', 'Nenhum requisito.', 'Seg-Sex 13h-15h', 'Rua Amor de Pais', '350', 'Batel', 'Curitiba', '80070-000', 4, '3,6,8', TRUE);
CALL salvar_novo_servico(34, 'Oficina de Artesanato com Recicláveis', '(51)95678-3333', 'Criação de peças com materiais recicláveis.', 'Materiais fornecidos nas oficinas.', 'Sáb-Dom 14h-17h', 'Rua Reciclo Arte', '100', 'Vila Flores', 'Porto Alegre', '90070-000', 5, '1,4,7', TRUE);
CALL salvar_novo_servico(35, 'Sessões de Terapia Holística', '(61)96789-4444', 'Atendimento terapêutico para equilíbrio emocional e físico.', 'Nenhum requisito.', 'Seg-Sex 10h-16h', 'Rua Bem-Estar', '250', 'Asa Sul', 'Brasília', '70140-000', 6, '2,5,9', TRUE);
CALL salvar_novo_servico(36, 'Café Literário', '(71)97890-5555', 'Encontros literários e debates sobre livros.', 'Nenhum requisito.', 'Sáb-Dom 14h-16h', 'Rua dos Livros', '400', 'Pelourinho', 'Salvador', '40140-000', 7, '1,4,8', TRUE);
CALL salvar_novo_servico(37, 'Distribuição de Alimentos Quentes', '(81)98901-6666', 'Distribuição de sopa e alimentos quentes para moradores de rua.', 'Nenhum requisito.', 'Seg-Sex 18h-20h', 'Rua Acolhimento Quente', '230', 'Centro', 'Recife', '50090-000', 8, '3,6,9', TRUE);
CALL salvar_novo_servico(38, 'Escola de Línguas para Imigrantes', '(91)99012-7777', 'Aulas de português e outros idiomas para imigrantes.', 'Nenhum requisito.', 'Seg-Sex 09h-12h', 'Rua Idiomas para Todos', '180', 'São Brás', 'Belém', '66100-000', 9, '1,5,7', TRUE);
CALL salvar_novo_servico(39, 'Eventos de Conscientização Ambiental', '(11)90123-8888', 'Palestras e workshops sobre sustentabilidade e meio ambiente.', 'Nenhum requisito.', 'Seg-Sex 08h-12h', 'Rua Verde Viver', '50', 'Itaim Bibi', 'São Paulo', '04530-000', 1, '2,5,9', TRUE);
CALL salvar_novo_servico(40, 'Bazar Solidário', '(21)91234-9999', 'Venda de produtos doados para arrecadação de fundos para ONGs.', 'Nenhum requisito.', 'Sáb-Dom 10h-16h', 'Rua da Solidariedade', '300', 'Ipanema', 'Rio de Janeiro', '22080-000', 2, '3,6,8', TRUE);
CALL salvar_novo_servico(41, 'Recolhimento de Lixo Eletrônico', '(31)92345-0101', 'Coleta de eletrônicos para descarte ambientalmente correto.', 'Nenhum requisito.', 'Seg-Sex 09h-12h', 'Rua do Descarte', '500', 'Cidade Nova', 'Belo Horizonte', '30160-000', 3, '1,4,7', TRUE);
CALL salvar_novo_servico(42, 'Encontros de Meditação Guiada', '(41)93456-1111', 'Sessões de meditação para redução de estresse.', 'Nenhum requisito.', 'Seg-Sex 07h-08h', 'Rua Paz Interior', '60', 'Santa Felicidade', 'Curitiba', '80080-000', 4, '2,5,8', TRUE);
CALL salvar_novo_servico(43, 'Biblioteca Comunitária', '(51)94567-2222', 'Empréstimo gratuito de livros para a comunidade.', 'Cadastro prévio.', 'Seg-Sex 09h-16h', 'Rua Leitura Livre', '120', 'São João', 'Porto Alegre', '90080-000', 5, '3,6,9', TRUE);
CALL salvar_novo_servico(44, 'Campanha de Doação de Roupas', '(61)95678-3333', 'Arrecadação de roupas para pessoas em situação de vulnerabilidade.', 'Nenhum requisito.', 'Seg-Sex 10h-16h', 'Rua do Amor ao Próximo', '220', 'Águas Claras', 'Brasília', '70150-000', 6, '1,4,7', TRUE);
CALL salvar_novo_servico(45, 'Serviço de Inclusão Digital', '(71)96789-4444', 'Acesso a computadores e internet para população de baixa renda.', 'Nenhum requisito.', 'Seg-Sex 10h-18h', 'Rua Digital Inclusiva', '280', 'Lapa', 'Salvador', '40020-000', 7, '2,5,8', TRUE);
CALL salvar_novo_servico(46, 'Oficina de Reciclagem Criativa', '(81)97890-5555', 'Criação de objetos artísticos e úteis a partir de recicláveis.', 'Materiais fornecidos nas oficinas.', 'Sáb-Dom 14h-18h', 'Rua ReciclArte', '420', 'Casa Forte', 'Recife', '50100-000', 8, '3,6,9', TRUE);
CALL salvar_novo_servico(47, 'Projeto de Leitura para Crianças', '(91)98901-6666', 'Sessões de leitura e contação de histórias para crianças.', 'Nenhum requisito.', 'Seg-Sex 14h-16h', 'Rua dos Pequenos Leitores', '200', 'Reduto', 'Belém', '66120-000', 9, '1,4,7', TRUE);
CALL salvar_novo_servico(48, 'Clube de Escoteiros', '(11)99012-7777', 'Atividades educativas e recreativas para crianças e adolescentes.', 'Fichamento de matrícula.', 'Sáb-Dom 09h-12h', 'Rua Aventura Jovem', '180', 'Vila Progredir', 'São Paulo', '05030-000', 1, '2,5,8', TRUE);
CALL salvar_novo_servico(49, 'Aulas de Skate para Jovens', '(21)90123-8888', 'Treinamento de skate para iniciantes e avançados.', 'Equipamento básico de skate.', 'Seg-Sex 15h-18h', 'Rua Skate Livre', '110', 'Barra da Tijuca', 'Rio de Janeiro', '22620-000', 2, '3,6,9', TRUE);
CALL salvar_novo_servico(50, 'Oficina de Jardinagem Urbana', '(31)91234-9999', 'Ensino de jardinagem para cultivo urbano sustentável.', 'Materiais fornecidos nas oficinas.', 'Sáb-Dom 10h-13h', 'Rua Verde Viver', '50', 'Santo Antônio', 'Belo Horizonte', '30170-000', 3, '2,5,8', TRUE);
CALL salvar_novo_servico(51, 'Aula de Culinária Saudável', '(31)98765-4321', 'Aprenda receitas saudáveis e equilibradas.', 'Ingredientes inclusos.', 'Seg-Qua 14h-17h', 'Rua Sabor e Saúde', '100', 'Centro', 'Belo Horizonte', '30180-000', 2, '16', TRUE);
CALL salvar_novo_servico(52, 'Curso de Marcenaria', '(31)99876-5432', 'Técnicas básicas de marcenaria para iniciantes.', 'EPIs fornecidos.', 'Ter-Qui 09h-12h', 'Av. dos Carpinteiros', '200', 'Savassi', 'Belo Horizonte', '30190-000', 4, '', TRUE);
CALL salvar_novo_servico(53, 'Oficina de Teatro', '(31)91234-5678', 'Expressão corporal e improvisação para iniciantes.', 'Roupas confortáveis recomendadas.', 'Seg-Sex 18h-21h', 'Rua das Artes', '150', 'Funcionários', 'Belo Horizonte', '30200-000', 5, '16', TRUE);
CALL salvar_novo_servico(54, 'Curso de Costura', '(31)93456-7890', 'Aprenda a costurar roupas e acessórios.', 'Máquinas de costura disponíveis.', 'Qua-Sex 13h-16h', 'Rua dos Tecidos', '180', 'Lourdes', 'Belo Horizonte', '30210-000', 3, '', TRUE);
CALL salvar_novo_servico(55, 'Treinamento em Primeiros Socorros', '(31)95678-1234', 'Noções básicas de primeiros socorros.', 'Certificado de participação.', 'Sáb-Dom 09h-12h', 'Av. da Saúde', '75', 'Cidade Nova', 'Belo Horizonte', '30220-000', 6, '16', TRUE);
CALL salvar_novo_servico(56, 'Curso de Fotografia', '(31)97890-3456', 'Introdução à fotografia digital.', 'Traga sua câmera ou celular.', 'Ter-Qui 15h-18h', 'Rua dos Fotógrafos', '220', 'Pampulha', 'Belo Horizonte', '30230-000', 1, '', TRUE);
CALL salvar_novo_servico(57, 'Aulas de Violão', '(31)99012-6789', 'Aprenda violão do básico ao avançado.', 'Instrumento pode ser emprestado.', 'Seg-Sex 19h-22h', 'Rua da Música', '300', 'Santa Efigênia', 'Belo Horizonte', '30240-000', 7, '16', TRUE);
CALL salvar_novo_servico(58, 'Curso de Programação Web', '(31)90123-4567', 'HTML, CSS e JavaScript para iniciantes.', 'Notebook recomendado.', 'Seg-Qua 10h-13h', 'Av. dos Coders', '120', 'Centro', 'Belo Horizonte', '30250-000', 8, '', TRUE);
CALL salvar_novo_servico(59, 'Treinamento em Oratória', '(31)91234-7890', 'Melhore sua comunicação e desenvoltura.', 'Atividades práticas.', 'Ter-Qui 17h-20h', 'Rua da Comunicação', '50', 'Savassi', 'Belo Horizonte', '30260-000', 5, '16', TRUE);
CALL salvar_novo_servico(60, 'Curso de Jardinagem', '(31)92345-6789', 'Técnicas para cultivo de plantas e flores.', 'Materiais fornecidos.', 'Sáb-Dom 09h-12h', 'Av. Verde', '80', 'Santa Tereza', 'Belo Horizonte', '30270-000', 3, '', TRUE);
CALL salvar_novo_servico(61, 'Curso de Design Gráfico', '(31)93456-7890', 'Introdução ao Photoshop e Illustrator.', 'Computador necessário.', 'Qua-Sex 14h-17h', 'Rua da Criatividade', '250', 'Lourdes', 'Belo Horizonte', '30280-000', 2, '16', TRUE);
CALL salvar_novo_servico(62, 'Oficina de Artesanato', '(31)94567-8901', 'Criação de peças artesanais.', 'Materiais inclusos.', 'Seg-Qua 09h-12h', 'Rua das Artes', '180', 'Cidade Nova', 'Belo Horizonte', '30290-000', 4, '', TRUE);
CALL salvar_novo_servico(63, 'Curso de Redação Criativa', '(31)95678-9012', 'Aprenda técnicas de escrita criativa.', 'Material didático incluso.', 'Ter-Qui 15h-18h', 'Av. dos Escritores', '95', 'Santa Efigênia', 'Belo Horizonte', '30300-000', 6, '16', TRUE);
CALL salvar_novo_servico(64, 'Aula de Yoga', '(31)96789-0123', 'Posturas e meditação para equilíbrio.', 'Traga seu tapete.', 'Seg-Sex 07h-08h', 'Rua da Paz', '220', 'Pampulha', 'Belo Horizonte', '30310-000', 7, '', TRUE);
CALL salvar_novo_servico(65, 'Curso de Empreendedorismo', '(31)97890-1234', 'Aprenda a abrir seu próprio negócio.', 'Apostila digital inclusa.', 'Sáb-Dom 14h-17h', 'Av. dos Negócios', '55', 'Centro', 'Belo Horizonte', '30320-000', 8, '16', TRUE);
CALL salvar_novo_servico(66, 'Oficina de Robótica', '(31)98901-2345', 'Introdução à robótica para iniciantes.', 'Kits de montagem disponíveis.', 'Qua-Sex 10h-13h', 'Rua da Tecnologia', '160', 'Lourdes', 'Belo Horizonte', '30330-000', 1, '', TRUE);
CALL salvar_novo_servico(67, 'Curso de Astronomia', '(31)99012-3456', 'Observação do céu e planetas.', 'Telescópio disponível no local.', 'Ter-Qui 19h-22h', 'Av. dos Astros', '210', 'Savassi', 'Belo Horizonte', '30340-000', 2, '16', TRUE);
CALL salvar_novo_servico(68, 'Treinamento em Marketing Digital', '(31)90123-4567', 'Redes sociais e estratégias digitais.', 'Certificado incluso.', 'Seg-Qua 13h-16h', 'Rua do Marketing', '140', 'Cidade Nova', 'Belo Horizonte', '30350-000', 3, '', TRUE);
CALL salvar_novo_servico(69, 'Curso de Mecânica Básica', '(31)91234-5678', 'Aprenda manutenção básica de veículos.', 'EPIs fornecidos.', 'Sáb-Dom 09h-12h', 'Av. dos Motores', '190', 'Pampulha', 'Belo Horizonte', '30360-000', 4, '16', TRUE);
CALL salvar_novo_servico(70, 'Aulas de Dança de Salão', '(31)92345-6789', 'Salsa, forró e samba de gafieira.', 'Roupas confortáveis recomendadas.', 'Seg-Sex 18h-21h', 'Rua da Dança', '130', 'Centro', 'Belo Horizonte', '30370-000', 5, '', TRUE);

### Exemplo de chamada de procedure
### (ID do serviço na tabela novo_servico, ID do admin que rejeitou)
# CALL rejeitar_servico(1, 1); -- Rejeita a indicação de serviço em novo_servico

# Criando várias rejeições de novo_servico
CALL rejeitar_servico(5, 1);
CALL rejeitar_servico(12, 2);
CALL rejeitar_servico(7, 3);
CALL rejeitar_servico(20, 1);
CALL rejeitar_servico(33, 2);
CALL rejeitar_servico(18, 3);
CALL rejeitar_servico(25, 1);
CALL rejeitar_servico(9, 2);
CALL rejeitar_servico(40, 1);
CALL rejeitar_servico(13, 3);
CALL rejeitar_servico(28, 2);
CALL rejeitar_servico(35, 1);
CALL rejeitar_servico(17, 3);
CALL rejeitar_servico(2, 1);
CALL rejeitar_servico(22, 2);
CALL rejeitar_servico(8, 3);
CALL rejeitar_servico(30, 1);
CALL rejeitar_servico(3, 2);
CALL rejeitar_servico(50, 3);
CALL rejeitar_servico(19, 1);
CALL rejeitar_servico(52, 1);
CALL rejeitar_servico(61, 2);
CALL rejeitar_servico(73, 3);
CALL rejeitar_servico(84, 1);
CALL rejeitar_servico(96, 2);
CALL rejeitar_servico(102, 3);
CALL rejeitar_servico(115, 1);
CALL rejeitar_servico(121, 2);
CALL rejeitar_servico(124, 3);
CALL rejeitar_servico(58, 1);
CALL rejeitar_servico(67, 2);
CALL rejeitar_servico(79, 3);
CALL rejeitar_servico(88, 1);
CALL rejeitar_servico(99, 2);
CALL rejeitar_servico(107, 3);
CALL rejeitar_servico(116, 1);
CALL rejeitar_servico(120, 2);
CALL rejeitar_servico(123, 3);
CALL rejeitar_servico(63, 1);
CALL rejeitar_servico(74, 2);
CALL rejeitar_servico(85, 3);
CALL rejeitar_servico(92, 1);
CALL rejeitar_servico(104, 2);
CALL rejeitar_servico(110, 3);
CALL rejeitar_servico(118, 1);
CALL rejeitar_servico(122, 2);


### Exemplo de chamada de procedure 
### (ID do serviço na tabela novo_servico, ID do admin que aprovou)
# CALL aprovar_servico(2, 1); -- Aceita a indicação de novo_servico, duplicando o dado em servico e atualizando o campo em novo_servico

# Criando várias aprovações de novo_servico
CALL aprovar_servico(1, 2);
CALL aprovar_servico(6, 3);
CALL aprovar_servico(14, 1);
CALL aprovar_servico(21, 2);
CALL aprovar_servico(34, 3);
CALL aprovar_servico(11, 1);
CALL aprovar_servico(25, 2);
CALL aprovar_servico(15, 3);
CALL aprovar_servico(38, 1);
CALL aprovar_servico(27, 2);
CALL aprovar_servico(44, 3);
CALL aprovar_servico(19, 1);
CALL aprovar_servico(3, 2);
CALL aprovar_servico(17, 3);
CALL aprovar_servico(22, 1);
CALL aprovar_servico(32, 2);
CALL aprovar_servico(9, 3);
CALL aprovar_servico(28, 1);
CALL aprovar_servico(49, 2);
CALL aprovar_servico(5, 3);
CALL aprovar_servico(51, 1);
CALL aprovar_servico(62, 2);
CALL aprovar_servico(73, 3);
CALL aprovar_servico(84, 1);
CALL aprovar_servico(95, 2);
CALL aprovar_servico(103, 3);
CALL aprovar_servico(112, 1);
CALL aprovar_servico(121, 2);
CALL aprovar_servico(124, 3);
CALL aprovar_servico(58, 1);
CALL aprovar_servico(67, 2);
CALL aprovar_servico(79, 3);
CALL aprovar_servico(88, 1);
CALL aprovar_servico(99, 2);
CALL aprovar_servico(107, 3);
CALL aprovar_servico(116, 1);
CALL aprovar_servico(120, 2);
CALL aprovar_servico(123, 3);
CALL aprovar_servico(63, 1);
CALL aprovar_servico(74, 2);
CALL aprovar_servico(85, 3);
CALL aprovar_servico(92, 1);
CALL aprovar_servico(104, 2);
CALL aprovar_servico(110, 3);
CALL aprovar_servico(118, 1);
CALL aprovar_servico(122, 2);
CALL aprovar_servico(51, 1);
CALL aprovar_servico(52, 2);
CALL aprovar_servico(53, 3);
CALL aprovar_servico(54, 1);
CALL aprovar_servico(55, 2);
CALL aprovar_servico(56, 3);
CALL aprovar_servico(57, 1);
CALL aprovar_servico(58, 2);
CALL aprovar_servico(59, 3);
CALL aprovar_servico(60, 1);
CALL aprovar_servico(61, 2);
CALL aprovar_servico(62, 3);
CALL aprovar_servico(63, 1);
CALL aprovar_servico(64, 2);
CALL aprovar_servico(65, 3);
CALL aprovar_servico(66, 1);
CALL aprovar_servico(67, 2);
CALL aprovar_servico(68, 3);
CALL aprovar_servico(69, 1);
CALL aprovar_servico(70, 2);
CALL aprovar_servico(71, 3);
CALL aprovar_servico(72, 1);
CALL aprovar_servico(73, 2);
CALL aprovar_servico(74, 3);
CALL aprovar_servico(75, 1);
CALL aprovar_servico(76, 2);
CALL aprovar_servico(77, 3);
CALL aprovar_servico(78, 1);
CALL aprovar_servico(79, 2);

### Exemplo de chamada de procedure 
### (ID gerado no navegador do usuario, pontuação de 1 a 5, feedback, se está concluído ou não, chave estrangeira do servico)
# CALL salvar_avaliacao(1, 5, "Teste de avaliação temporaria", FALSE, 1); -- (FALSE) Insere dados em avaliacao_temp 
# CALL salvar_avaliacao(1, 2, "Teste de avaliação definitiva", TRUE, 1); -- (TRUE) Insere dados direto em avaliacao

# Criando dados na tabela avaliacao_temp
CALL salvar_avaliacao(1, 3, 'Avaliação média, poderia melhorar.', FALSE, 1);
CALL salvar_avaliacao(2, 4, 'Bom serviço, mas poderia ser mais rápido.', FALSE, 2);
CALL salvar_avaliacao(3, 5, 'Excelente serviço, muito satisfeito!', FALSE, 3);
CALL salvar_avaliacao(4, 2, 'A experiência foi insatisfatória, precisa de melhorias.', FALSE, 4);
CALL salvar_avaliacao(5, 3, 'Não foi o melhor, mas aceitável.', FALSE, 5);
CALL salvar_avaliacao(6, 1, 'Muito ruim, não gostei da experiência.', FALSE, 6);
CALL salvar_avaliacao(7, 4, 'Bom, mas precisa de ajustes em alguns pontos.', FALSE, 7);
CALL salvar_avaliacao(8, 5, 'Perfeito, super recomendo!', FALSE, 8);
CALL salvar_avaliacao(9, 3, 'Faltou atenção aos detalhes.', FALSE, 9);
CALL salvar_avaliacao(10, 2, 'Não atendeu às minhas expectativas.', FALSE, 10);
CALL salvar_avaliacao(11, 4, 'Bom, mas poderia ser mais eficiente.', FALSE, 11);
CALL salvar_avaliacao(12, 5, 'Totalmente satisfeito, sem pontos negativos!', FALSE, 12);
CALL salvar_avaliacao(13, 3, 'Satisfeito, mas com algumas ressalvas.', FALSE, 13);
CALL salvar_avaliacao(14, 2, 'Serviço demorado e pouco eficaz.', FALSE, 14);
CALL salvar_avaliacao(15, 4, 'Muito bom, porém precisa melhorar o suporte.', FALSE, 15);
CALL salvar_avaliacao(16, 1, 'Decepcionante, não volto mais.', FALSE, 16);
CALL salvar_avaliacao(17, 3, 'Atendeu ao esperado, mas nada excepcional.', FALSE, 17);
CALL salvar_avaliacao(18, 5, 'Fiquei muito feliz com o resultado!', FALSE, 18);
CALL salvar_avaliacao(19, 2, 'A qualidade do serviço deixou a desejar.', FALSE, 19);
CALL salvar_avaliacao(20, 4, 'Gostei, mas acredito que poderia ser mais personalizado.', FALSE, 20);
CALL salvar_avaliacao(21, 4, 'Muito bom, mas o tempo de espera foi longo.', FALSE, 21);
CALL salvar_avaliacao(22, 5, 'Perfeito! Superou minhas expectativas.', FALSE, 22);
CALL salvar_avaliacao(23, 3, 'Faltaram alguns recursos, mas nada grave.', FALSE, 23);
CALL salvar_avaliacao(24, 2, 'Fiquei frustrado, não consegui obter o resultado esperado.', FALSE, 24);
CALL salvar_avaliacao(25, 4, 'Serviço de qualidade, mas um pouco caro.', FALSE, 25);
CALL salvar_avaliacao(26, 1, 'Extremamente decepcionado. Não valeu a pena.', FALSE, 26);
CALL salvar_avaliacao(27, 3, 'Aceitável, mas não voltaria.', FALSE, 27);
CALL salvar_avaliacao(28, 4, 'Bom serviço, mas pode ser mais eficiente.', FALSE, 28);
CALL salvar_avaliacao(29, 5, 'Perfeito, super recomendado!', FALSE, 29);
CALL salvar_avaliacao(30, 2, 'Senti falta de alguns recursos importantes.', FALSE, 30);
CALL salvar_avaliacao(31, 3, 'Serviço simples, mas funcional.', FALSE, 31);
CALL salvar_avaliacao(32, 5, 'Tudo funcionou perfeitamente, ótima experiência!', FALSE, 32);
CALL salvar_avaliacao(33, 4, 'Boa experiência, mas pode melhorar a interface.', FALSE, 33);
CALL salvar_avaliacao(34, 2, 'Faltou clareza nas instruções, não gostei.', FALSE, 34);
CALL salvar_avaliacao(35, 5, 'Excelente! A experiência foi fantástica.', FALSE, 35);
CALL salvar_avaliacao(36, 3, 'Mediano, não foi tão bom quanto eu esperava.', FALSE, 36);
CALL salvar_avaliacao(37, 4, 'Bastante bom, mas o preço foi um pouco elevado.', FALSE, 37);
CALL salvar_avaliacao(38, 1, 'Muito ruim, não recomendo a ninguém.', FALSE, 38);
CALL salvar_avaliacao(39, 2, 'Serviço demorado e não atendeu totalmente às minhas necessidades.', FALSE, 39);
CALL salvar_avaliacao(40, 5, 'Impressionante! Voltarei com certeza.', FALSE, 40);
CALL salvar_avaliacao(41, 4, 'Muito bom, mas poderia ser mais rápido.', FALSE, 41);
CALL salvar_avaliacao(42, 5, 'Excelente, tudo funcionou como esperado!', FALSE, 42);
CALL salvar_avaliacao(43, 3, 'Bom, mas algumas melhorias seriam bem-vindas.', FALSE, 43);
CALL salvar_avaliacao(44, 2, 'Fiquei um pouco desapontado, não foi tão bom quanto o esperado.', FALSE, 44);
CALL salvar_avaliacao(45, 4, 'Bom, mas a interface pode ser mais intuitiva.', FALSE, 45);
CALL salvar_avaliacao(46, 5, 'Adorei! Superou minhas expectativas.', FALSE, 46);
CALL salvar_avaliacao(47, 3, 'Satisfatório, mas pode melhorar em alguns pontos.', FALSE, 47);
CALL salvar_avaliacao(48, 1, 'Infelizmente, a experiência foi muito ruim.', FALSE, 48);
CALL salvar_avaliacao(49, 2, 'A qualidade não correspondeu ao que foi prometido.', FALSE, 49);
CALL salvar_avaliacao(50, 4, 'Gostei, mas a documentação poderia ser mais clara.', FALSE, 50);

# Criando dados para a tabela avaliacao 
CALL salvar_avaliacao(1, 4, 'Excelente, mas poderia ser mais rápido.', TRUE, 1);
CALL salvar_avaliacao(2, 5, 'Superou minhas expectativas, estou muito satisfeito!', TRUE, 2);
CALL salvar_avaliacao(3, 3, 'Bom, mas pode melhorar em alguns aspectos.', TRUE, 3);
CALL salvar_avaliacao(4, 2, 'Não atendeu às minhas expectativas, precisa de melhorias.', TRUE, 4);
CALL salvar_avaliacao(5, 4, 'Serviço de boa qualidade, porém o preço é um pouco alto.', TRUE, 5);
CALL salvar_avaliacao(6, 5, 'Perfeito! Não tenho nenhuma reclamação.', TRUE, 6);
CALL salvar_avaliacao(7, 3, 'Satisfatório, mas poderia ser mais eficiente.', TRUE, 7);
CALL salvar_avaliacao(8, 4, 'Bom, porém a interface precisa de ajustes.', TRUE, 8);
CALL salvar_avaliacao(9, 5, 'Ótima experiência! Super recomendado.', TRUE, 9);
CALL salvar_avaliacao(10, 2, 'Poderia ser melhor, falhou em alguns pontos.', TRUE, 10);
CALL salvar_avaliacao(11, 4, 'Boa experiência, mas o serviço poderia ser mais rápido.', TRUE, 11);
CALL salvar_avaliacao(12, 5, 'Totalmente satisfeito! O serviço foi excelente.', TRUE, 12);
CALL salvar_avaliacao(13, 3, 'Satisfatório, mas com algumas limitações.', TRUE, 13);
CALL salvar_avaliacao(14, 4, 'Bom serviço, mas falta um pouco mais de personalização.', TRUE, 14);
CALL salvar_avaliacao(15, 5, 'Excelente, adorei a qualidade do serviço!', TRUE, 15);
CALL salvar_avaliacao(16, 3, 'Aceitável, mas não é o que eu esperava.', TRUE, 16);
CALL salvar_avaliacao(17, 4, 'Bastante bom, mas poderia ter mais funcionalidades.', TRUE, 17);
CALL salvar_avaliacao(18, 2, 'Não gostei muito, não atendeu ao que foi prometido.', TRUE, 18);
CALL salvar_avaliacao(19, 5, 'Perfeito, super satisfeito com tudo!', TRUE, 19);
CALL salvar_avaliacao(20, 4, 'Muito bom, mas poderia ser mais intuitivo.', TRUE, 20);
CALL salvar_avaliacao(21, 4, 'Muito bom, mas o atendimento poderia ser mais rápido.', TRUE, 21);
CALL salvar_avaliacao(22, 5, 'Excelente! Não tenho o que reclamar.', TRUE, 22);
CALL salvar_avaliacao(23, 3, 'Foi bom, mas a interface poderia ser mais amigável.', TRUE, 23);
CALL salvar_avaliacao(24, 2, 'Decepcionante, não funcionou como esperado.', TRUE, 24);
CALL salvar_avaliacao(25, 4, 'Serviço bom, mas poderia ter mais opções de personalização.', TRUE, 25);
CALL salvar_avaliacao(26, 5, 'Perfeito, muito acima das minhas expectativas!', TRUE, 26);
CALL salvar_avaliacao(27, 3, 'Satisfatório, mas achei um pouco lento em alguns momentos.', TRUE, 27);
CALL salvar_avaliacao(28, 4, 'Bom, mas o design da interface precisa ser melhorado.', TRUE, 28);
CALL salvar_avaliacao(29, 5, 'Excelente! Recomendo para todos!', TRUE, 29);
CALL salvar_avaliacao(30, 2, 'Não gostei, o serviço demorou mais do que eu esperava.', TRUE, 30);
CALL salvar_avaliacao(31, 4, 'Muito bom, mas o sistema poderia ser mais eficiente.', TRUE, 31);
CALL salvar_avaliacao(32, 5, 'Fiquei muito feliz com o resultado, totalmente satisfeito!', TRUE, 32);
CALL salvar_avaliacao(33, 3, 'Foi bom, mas achei que poderia ter mais recursos.', TRUE, 33);
CALL salvar_avaliacao(34, 4, 'Bastante bom, mas a navegação poderia ser mais intuitiva.', TRUE, 34);
CALL salvar_avaliacao(35, 5, 'Adorei a experiência, muito bem feito!', TRUE, 35);
CALL salvar_avaliacao(36, 3, 'Foi bom, mas falta um pouco de personalização.', TRUE, 36);
CALL salvar_avaliacao(37, 4, 'Gostei, mas poderia ser mais rápido e eficiente.', TRUE, 37);
CALL salvar_avaliacao(38, 2, 'Serviço razoável, mas com muitos pontos negativos.', TRUE, 38);
CALL salvar_avaliacao(39, 5, 'Perfeito! Não tenho nada a reclamar, super recomendo.', TRUE, 39);
CALL salvar_avaliacao(40, 4, 'Bom serviço, mas poderia ter mais opções de recursos.', TRUE, 40);
CALL salvar_avaliacao(41, 4, 'Bom serviço, mas poderia ser mais rápido.', TRUE, 41);
CALL salvar_avaliacao(42, 5, 'Excelente, tudo funcionou perfeitamente!', TRUE, 42);
CALL salvar_avaliacao(43, 3, 'Foi bom, mas achei que poderia ser mais simples.', TRUE, 43);
CALL salvar_avaliacao(44, 2, 'Não atendeu às minhas expectativas, precisa melhorar.', TRUE, 44);
CALL salvar_avaliacao(45, 4, 'Gostei, mas a interface precisa ser mais intuitiva.', TRUE, 45);
CALL salvar_avaliacao(46, 5, 'Perfeito, muito satisfeito com a experiência!', TRUE, 46);
CALL salvar_avaliacao(47, 3, 'Satisfatório, mas pode melhorar em alguns pontos.', TRUE, 47);
CALL salvar_avaliacao(48, 4, 'Bastante bom, mas o tempo de resposta foi um pouco demorado.', TRUE, 48);
CALL salvar_avaliacao(49, 2, 'Fiquei frustrado, o serviço não atendeu ao que foi prometido.', TRUE, 49);
CALL salvar_avaliacao(50, 5, 'Super satisfeito, a experiência foi incrível!', TRUE, 50);

### Exemplo de chamada de procedure
### (ID gerado no navegador do usuario, feedback, se está concluído ou não, chave estrangeira do servico)
# CALL salvar_denuncia(10, "Em mais 2", FALSE, 1); -- (FALSE) Insere dados em denuncia_temp
# CALL salvar_denuncia(10, "denuncia", TRUE, 1); -- (TRUE) Insere dados direto em denuncia

# Criando dados para a tabela denuncia_temp
CALL salvar_denuncia(1, 'O atendimento médico foi rápido, mas a qualidade da consulta deixou a desejar.', FALSE, 1);
CALL salvar_denuncia(2, 'Fiquei esperando muito tempo para ser atendido, a estrutura é precária.', FALSE, 2);
CALL salvar_denuncia(3, 'A escola tem professores bons, mas faltam recursos para atividades extracurriculares.', FALSE, 3);
CALL salvar_denuncia(4, 'A biblioteca tem poucos livros e o espaço é pequeno demais.', FALSE, 4);
CALL salvar_denuncia(5, 'O curso de informática gratuito não foi bem estruturado e não atendia a todos os níveis.', FALSE, 5);
CALL salvar_denuncia(6, 'A unidade de saúde estava muito cheia e não havia condições adequadas de higiene.', FALSE, 6);
CALL salvar_denuncia(7, 'A quadra esportiva estava em péssimas condições, não foi possível praticar esporte com segurança.', FALSE, 7);
CALL salvar_denuncia(8, 'A atividade de lazer foi cancelada sem aviso prévio, muito frustrante.', FALSE, 8);
CALL salvar_denuncia(9, 'A biblioteca comunitária tem poucos funcionários, o que dificulta o empréstimo de livros.', FALSE, 9);
CALL salvar_denuncia(10, 'O serviço de orientação educacional não conseguiu me ajudar de maneira eficiente.', FALSE, 10);
CALL salvar_denuncia(11, 'Faltaram profissionais para atender a demanda no atendimento psicológico gratuito.', FALSE, 11);
CALL salvar_denuncia(12, 'A palestra sobre saúde mental foi interessante, mas faltaram materiais didáticos.', FALSE, 12);
CALL salvar_denuncia(13, 'O evento cultural foi cancelado por falta de organização.', FALSE, 13);
CALL salvar_denuncia(14, 'O serviço de transporte público gratuito estava sempre atrasado, o que dificultou o acesso ao centro de saúde.', FALSE, 14);
CALL salvar_denuncia(15, 'O curso gratuito de inglês foi interrompido sem nenhuma justificativa adequada.', FALSE, 15);
CALL salvar_denuncia(16, 'O serviço de apoio a idosos não tinha estrutura suficiente para atender todos que precisavam.', FALSE, 16);
CALL salvar_denuncia(17, 'A peça de teatro gratuita estava mal montada e não conseguiu prender a atenção do público.', FALSE, 17);
CALL salvar_denuncia(18, 'A assistência jurídica gratuita demorou para retornar, e quando o fez, não havia muito apoio.', FALSE, 18);
CALL salvar_denuncia(19, 'O serviço de entrega de medicamentos foi eficaz, mas o tempo de espera foi muito longo.', FALSE, 19);
CALL salvar_denuncia(20, 'O evento de lazer para crianças estava mal organizado e sem recursos suficientes.', FALSE, 20);
CALL salvar_denuncia(21, 'A limpeza da unidade de saúde foi insatisfatória, muitos locais estavam sujos.', FALSE, 21);
CALL salvar_denuncia(22, 'O curso de culinária gratuito não possuía materiais adequados, o que prejudicou o aprendizado.', FALSE, 22);
CALL salvar_denuncia(23, 'A unidade de lazer comunitária estava fechada quando cheguei, sem aviso prévio.', FALSE, 23);
CALL salvar_denuncia(24, 'A assistência educacional para alunos com deficiência não foi eficiente, não havia adaptações suficientes.', FALSE, 24);
CALL salvar_denuncia(25, 'O atendimento no centro de saúde foi bom, mas o tempo de espera foi muito longo.', FALSE, 25);
CALL salvar_denuncia(26, 'Fui ao evento cultural e fiquei desapontado com a falta de organização e infraestrutura.', FALSE, 26);
CALL salvar_denuncia(27, 'O atendimento psicológico gratuito estava sendo feito por um estagiário, sem supervisão adequada.', FALSE, 27);
CALL salvar_denuncia(28, 'O serviço de transporte gratuito estava superlotado, o que dificultou o deslocamento até a escola.', FALSE, 28);
CALL salvar_denuncia(29, 'O atendimento na escola pública não tem sido bom, os professores não têm recursos suficientes para ensinar.', FALSE, 29);
CALL salvar_denuncia(30, 'A praça onde ocorre o lazer gratuito está em péssimas condições e sem manutenção.', FALSE, 30);
CALL salvar_denuncia(31, 'A biblioteca comunitária não tinha livros atualizados e o ambiente era muito barulhento para estudar.', FALSE, 31);
CALL salvar_denuncia(32, 'A oficina de teatro para crianças foi bem planejada, mas o espaço era pequeno e desconfortável.', FALSE, 32);
CALL salvar_denuncia(33, 'O curso de arte gratuito não foi bem estruturado, a instrutora não estava preparada.', FALSE, 33);
CALL salvar_denuncia(34, 'O evento de saúde pública estava mal divulgado, muitos não conseguiram participar por falta de informações.', FALSE, 34);
CALL salvar_denuncia(35, 'O centro de apoio à criança e adolescente estava superlotado, não conseguia atender todas as demandas.', FALSE, 35);
CALL salvar_denuncia(36, 'O espaço cultural estava fechado em horários que foram previamente anunciados como disponíveis.', FALSE, 36);
CALL salvar_denuncia(37, 'O curso de jardinagem não foi bem organizado, o material não estava disponível na hora certa.', FALSE, 37);
CALL salvar_denuncia(38, 'O evento cultural gratuito não tinha um conteúdo interessante, os participantes estavam desanimados.', FALSE, 38);
CALL salvar_denuncia(39, 'O apoio jurídico gratuito demorou muito para retornar as minhas dúvidas, não consegui resolver o problema.', FALSE, 39);
CALL salvar_denuncia(40, 'O serviço de saúde mental foi desorganizado, a consulta foi marcada, mas o profissional não apareceu.', FALSE, 40);
CALL salvar_denuncia(41, 'O curso de fotografia foi muito básico, não aprendi nada de novo e o material estava desatualizado.', FALSE, 41);
CALL salvar_denuncia(42, 'O evento de saúde ofereceu exames gratuitos, mas as filas estavam imensas e o atendimento foi confuso.', FALSE, 42);
CALL salvar_denuncia(43, 'A praça de esportes estava mal conservada, com equipamentos quebrados e sem manutenção.', FALSE, 43);
CALL salvar_denuncia(44, 'O curso de música gratuito foi cancelado sem aviso prévio, fiquei desapontado com a falta de organização.', FALSE, 44);
CALL salvar_denuncia(45, 'O atendimento na escola pública foi muito demorado, não consegui falar com o diretor para resolver o problema.', FALSE, 45);
CALL salvar_denuncia(46, 'A atividade cultural de dança para idosos foi mal estruturada, com pouca assistência e sem adaptação para as necessidades dos participantes.', FALSE, 46);
CALL salvar_denuncia(47, 'O serviço de transporte gratuito estava sempre atrasado e não havia informações sobre horários e pontos de embarque.', FALSE, 47);
CALL salvar_denuncia(48, 'O apoio psicológico na escola não foi eficaz, os profissionais não tinham tempo suficiente para atender a todos os alunos.', FALSE, 48);
CALL salvar_denuncia(49, 'O centro comunitário de lazer estava fechado durante os horários anunciados, fiquei esperando sem saber o motivo.', FALSE, 49);
CALL salvar_denuncia(50, 'O curso de alfabetização para adultos foi interrompido sem aviso, e os participantes ficaram sem alternativas de aprendizado.', FALSE, 50);

# Criando dados para a tabela denuncia
CALL salvar_denuncia(1, 'O atendimento na unidade de saúde foi rápido e eficiente, fiquei satisfeito com o serviço.', TRUE, 1);
CALL salvar_denuncia(2, 'A escola ofereceu uma ótima infraestrutura e o material didático estava em perfeito estado.', TRUE, 2);
CALL salvar_denuncia(3, 'O curso de informática foi bem estruturado, aprendi novas habilidades e os instrutores foram muito atenciosos.', TRUE, 3);
CALL salvar_denuncia(4, 'A biblioteca está muito bem organizada e o ambiente de estudo é tranquilo e confortável.', TRUE, 4);
CALL salvar_denuncia(5, 'O evento cultural foi maravilhoso, a organização estava impecável e a programação foi ótima.', TRUE, 5);
CALL salvar_denuncia(6, 'O atendimento psicológico foi excelente, o profissional foi muito atencioso e me ajudou a resolver meus problemas.', TRUE, 6);
CALL salvar_denuncia(7, 'O serviço de transporte gratuito foi pontual, eficiente e facilitou muito o acesso ao centro de saúde.', TRUE, 7);
CALL salvar_denuncia(8, 'O curso de culinária gratuito foi muito bom, aprendi novas receitas e as aulas foram bem organizadas.', TRUE, 8);
CALL salvar_denuncia(9, 'O centro de lazer comunitário está sempre bem mantido e oferece atividades variadas para todas as idades.', TRUE, 9);
CALL salvar_denuncia(10, 'O apoio educacional para alunos com necessidades especiais foi muito eficaz, a escola adaptou todos os materiais para atendê-los.', TRUE, 10);
CALL salvar_denuncia(11, 'A assistência jurídica gratuita foi muito eficiente, consegui resolver meu problema rapidamente.', TRUE, 11);
CALL salvar_denuncia(12, 'A unidade de saúde tem excelente atendimento, os médicos são atenciosos e o ambiente é bem organizado.', TRUE, 12);
CALL salvar_denuncia(13, 'A palestra sobre saúde mental foi muito informativa e ajudou a entender melhor sobre o tema.', TRUE, 13);
CALL salvar_denuncia(14, 'A quadra esportiva comunitária estava bem conservada e ofereceu ótimas condições para praticar esportes.', TRUE, 14);
CALL salvar_denuncia(15, 'O curso de inglês gratuito foi bem estruturado, o material estava disponível e o professor foi muito competente.', TRUE, 15);
CALL salvar_denuncia(16, 'A atividade de lazer para crianças foi bem planejada, as crianças se divertiram bastante e foi um evento seguro.', TRUE, 16);
CALL salvar_denuncia(17, 'O espaço cultural está sempre bem organizado, com eventos interessantes e acesso gratuito para todos.', TRUE, 17);
CALL salvar_denuncia(18, 'O serviço de orientação educacional foi muito útil, recebi informações valiosas sobre como melhorar o desempenho escolar.', TRUE, 18);
CALL salvar_denuncia(19, 'A unidade de saúde tem ótimas condições, os profissionais são muito capacitados e o atendimento é rápido e eficiente.', TRUE, 19);
CALL salvar_denuncia(20, 'O evento de lazer para idosos foi muito bem organizado, com atividades que atenderam a todas as necessidades da faixa etária.', TRUE, 20);
CALL salvar_denuncia(21, 'A assistência à saúde foi excelente, fui atendido rapidamente e o médico foi muito atencioso.', TRUE, 21);
CALL salvar_denuncia(22, 'A escola pública tem ótimos professores e uma infraestrutura que atende bem aos alunos.', TRUE, 22);
CALL salvar_denuncia(23, 'O evento cultural foi muito bem organizado e teve uma programação diversificada e interessante.', TRUE, 23);
CALL salvar_denuncia(24, 'O serviço de apoio psicológico gratuito foi fundamental para o meu bem-estar, os profissionais foram muito atenciosos.', TRUE, 24);
CALL salvar_denuncia(25, 'O curso gratuito de informática foi muito bom, com conteúdo atualizado e instrutores qualificados.', TRUE, 25);
CALL salvar_denuncia(26, 'A biblioteca comunitária oferece um ótimo acervo e um ambiente calmo para estudo.', TRUE, 26);
CALL salvar_denuncia(27, 'O centro de lazer está sempre bem conservado e oferece atividades variadas para todas as idades.', TRUE, 27);
CALL salvar_denuncia(28, 'O atendimento médico foi rápido e eficaz, fui tratado com respeito e sem demora.', TRUE, 28);
CALL salvar_denuncia(29, 'O curso de jardinagem foi muito interessante, aprendi técnicas novas e o material estava disponível.', TRUE, 29);
CALL salvar_denuncia(30, 'O serviço de transporte gratuito foi muito pontual e facilitou o acesso à escola e ao centro de saúde.', TRUE, 30);
CALL salvar_denuncia(31, 'A assistência jurídica gratuita me ajudou a resolver um problema importante, com orientação clara e eficaz.', TRUE, 31);
CALL salvar_denuncia(32, 'A unidade de saúde tem excelentes profissionais e oferece atendimento de qualidade, sem demora.', TRUE, 32);
CALL salvar_denuncia(33, 'O evento de saúde preventiva foi muito bem organizado, com profissionais capacitados e um ambiente acolhedor.', TRUE, 33);
CALL salvar_denuncia(34, 'A palestra sobre educação ambiental foi muito educativa e abordou temas importantes para a comunidade.', TRUE, 34);
CALL salvar_denuncia(35, 'A praça de esportes estava bem cuidada e ofereceu uma ótima estrutura para a prática de atividades físicas.', TRUE, 35);
CALL salvar_denuncia(36, 'O curso de fotografia gratuito foi excelente, o material estava disponível e o instrutor foi muito qualificado.', TRUE, 36);
CALL salvar_denuncia(37, 'O atendimento educacional foi excelente, a escola oferece apoio a todos os alunos, independentemente das necessidades.', TRUE, 37);
CALL salvar_denuncia(38, 'A oficina de dança para idosos foi uma experiência maravilhosa, muito bem organizada e com profissionais capacitados.', TRUE, 38);
CALL salvar_denuncia(39, 'O evento cultural para crianças foi muito divertido e educativo, com atividades que prenderam a atenção de todos.', TRUE, 39);
CALL salvar_denuncia(40, 'O apoio à saúde mental foi incrível, a consulta foi rápida e o profissional me ajudou a entender melhor o tratamento.', TRUE, 40);
CALL salvar_denuncia(41, 'O curso de habilidades manuais foi excelente, aprendi várias técnicas novas e os instrutores foram ótimos.', TRUE, 41);
CALL salvar_denuncia(42, 'A unidade de saúde foi muito bem organizada, com profissionais qualificados e atendimento sem demora.', TRUE, 42);
CALL salvar_denuncia(43, 'O centro comunitário oferece ótimas atividades culturais e de lazer, proporcionando integração social para todos.', TRUE, 43);
CALL salvar_denuncia(44, 'A escola tem ótimos recursos e oferece apoio contínuo aos alunos, criando um ambiente de aprendizado saudável.', TRUE, 44);
CALL salvar_denuncia(45, 'O curso de arte foi muito interessante, o material estava de fácil acesso e o professor muito capacitado.', TRUE, 45);
CALL salvar_denuncia(46, 'O atendimento jurídico gratuito foi excelente, a equipe foi muito prestativa e me ajudou a resolver o meu problema.', TRUE, 46);
CALL salvar_denuncia(47, 'A praça de esportes estava impecável, com boas condições de uso e sempre bem mantida pela comunidade.', TRUE, 47);
CALL salvar_denuncia(48, 'O serviço de saúde mental foi muito eficaz, recebi um atendimento acolhedor e que me ajudou a superar a situação.', TRUE, 48);
CALL salvar_denuncia(49, 'O curso de yoga gratuito foi uma ótima experiência, com um ambiente calmo e instrutores experientes que me ajudaram a melhorar meu bem-estar.', TRUE, 49);
CALL salvar_denuncia(50, 'O evento cultural foi maravilhoso, com apresentações de qualidade e um público animado, fiquei muito satisfeito.', TRUE, 50);

UPDATE servico SET status = 'inativo' WHERE id = 5;
UPDATE servico SET status = 'inativo' WHERE id = 8;
UPDATE servico SET status = 'inativo' WHERE id = 12;
UPDATE servico SET status = 'inativo' WHERE id = 15;
UPDATE servico SET status = 'inativo' WHERE id = 18;
UPDATE servico SET status = 'inativo' WHERE id = 22;
UPDATE servico SET status = 'inativo' WHERE id = 25;
UPDATE servico SET status = 'inativo' WHERE id = 30;
UPDATE servico SET status = 'inativo' WHERE id = 34;
UPDATE servico SET status = 'inativo' WHERE id = 40;
UPDATE servico SET status = 'inativo' WHERE id = 45;
UPDATE servico SET status = 'inativo' WHERE id = 50;
UPDATE servico SET status = 'inativo' WHERE id = 55;
UPDATE servico SET status = 'inativo' WHERE id = 60;
UPDATE servico SET status = 'inativo' WHERE id = 70;