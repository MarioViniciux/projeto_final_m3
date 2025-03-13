<h1>Banco de Dados para Gerenciamento de Serviços Gratuitos</h1>

<h2>Problemática</h2>

Visto que muitas pessoas não possuem condições financeiras para pagarem por determinadas atividades, muitas instituições, impressas e locais buscam ofertar atendimentos de forma gratuita. Então decidimos conectar essas pessoas com essas entidades usando da tecnologia.

<h2>Solução</h2>

Este banco de dados tem como objetivo facilitar a gestão de serviços gratuitos, com foco na administração de serviços, sugestões, feedbacks e acessibilidade.

<h2>Estrutura do Banco de Dados</h2>

<h3>Tabelas</h3>

1. Serviços: Armazena os serviços disponíveis.

2. Novo Serviço: Sugestões de novos serviços enviadas pelos usuários.

3. Novo Serviço Temporário: Salva o progresso do formulário de sugestão.

4. Avaliação: Feedback positivo dos usuários.

5. Avaliação Temporária: Salva o progresso do formulário de avaliação.

6. Denúncia: Feedback negativo dos usuários.

7. Denúncia Temporária: Salva o progresso do formulário de denúncia.

8. Admin: Gerencia os administradores do sistema.

9. Acessibilidade: Informações sobre acessibilidade.

10. Categoria: Classificação de serviços (saúde, turismo, educação, esporte, etc.).

<h3>Funcionalidades</h3>

- Cadastro e gerenciamento de serviços.

- Controle de sugestões e feedbacks.

- Salvamento de progresso de formulários.

<h1>Como Criar o Banco de Dados</h1>

1. Abra o MySQL Workbench

2. Entre no localhost

3. Execute o arquivo creates.sql para a criação do banco de dados e tabelas

4. Execute o arquivo procedure.sql para a criação das procedures

5. Execute o arquivo event.sql para a craiação dos events

6. Insira os dados manualmente, ou execute o arquivo insert_e_call.sql para criar dados ficticios 

7. Execute os selects no arquivo selects.sql