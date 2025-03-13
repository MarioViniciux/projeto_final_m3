Banco de Dados para Gerenciamento de Serviços Gratuitos

Problemática 

Visto que muitas pessoas não possuem condições financeiras para pagarem por determinadas atividades, muitas instituições, impressas e locais buscam ofertar atendimentos de forma gratuita. Então decidimos conectar essas pessoas com essas entidades usando da tecnologia.

Solução

Este banco de dados tem como objetivo facilitar a gestão de serviços gratuitos, com foco na administração de serviços, sugestões, feedbacks e acessibilidade.

Estrutura do Banco de Dados

Tabelas

Serviços: Armazena os serviços disponíveis.

Novo Serviço: Sugestões de novos serviços enviadas pelos usuários.

Novo Serviço Temporário: Salva o progresso do formulário de sugestão.

Avaliação: Feedback positivo dos usuários.

Avaliação Temporária: Salva o progresso do formulário de avaliação.

Denúncia: Feedback negativo dos usuários.

Denúncia Temporária: Salva o progresso do formulário de denúncia.

Admin: Gerencia os administradores do sistema.

Acessibilidade: Informações sobre acessibilidade.

Categoria: Classificação de serviços (saúde, turismo, educação, esporte, etc.).

Funcionalidades

Cadastro e gerenciamento de serviços.

Controle de sugestões e feedbacks.

Salvamento de progresso de formulários.

 Como Criar o Banco de Dados

Abra o MySQL Workbench

Entre no localhost

Execute o arquivo creates.sql para a criação do banco de dados e tabelas

Execute o arquivo procedure.sql para a criação das procedures

Execute o arquivo event.sql para a craiação dos events

Insira os dados manualmente, ou execute o arquivo insert_e_call.sql para criar dados ficticios 

Execute os selects no arquivo selects.sql