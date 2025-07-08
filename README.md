Aluno: Aureamar Jose Garcia Rocha Email: aureamar.jose@gmail.com

# Task Control
Este é um projeto desenvolvido como parte do curso de Ruby on Rails. O objetivo é aplicar os conceitos aprendidos em aula para criar uma aplicação web funcional, bem estruturada e com boas práticas de desenvolvimento.

📦 Tecnologias Utilizadas
- Ruby 3.4.4
- Ruby on Rails 8.0.2
- PostgreSQL
  
## 🚀 Como rodar o projeto localmente

```bash
# Clone o repositório
git clone git@github.com:aureamarjose/task_control.git
cd task_control

# abra o VSCode
code .
# Inicie o projeto dentro do dev container
# Digite o comando
bundle install
rails db:create db:migrate 
# Polular o banco de dados
rails setup:populate
```

## ✅ Funcionalidades implementadas
Descreva aqui as principais funcionalidades da sua aplicação. Por exemplo:
- Controle de tarefas
- Filtro de pesquisa por responsável e situação da tarefa 
- CRUD sector/collaborator/task
- Envio de e-mails na criação de uma tarefa

## 🧠 Conceitos aplicados
Abaixo estão os conceitos aprendidos em aula e aplicados neste projeto, junto com a justificativa de sua utilização:

## 1. Rubocop e Ruby lsp
Utilizado para manter boas práticas no desenvolvimento do código mantendo um código padronizado.

## 2. Default Scope
É utilizado para filtrar registros ativos e inativos, evitando a perda de dados quando o usuário exclui algo que pode ser recuperado posteriormente. Além disso, evita a repetição de código e garante que regras, como exibir apenas registros ativos, sejam aplicadas de forma automática e consistente. Podendo ser observar no model Sector e Collaborator.

## 3. Decorators
Os decorators foram utilizados para separar a lógica de apresentação da lógica de negócio presente no model.
Como o model utilizava default_scope para filtrar apenas colaboradores ativos, colaboradores desativados não apareciam corretamente na renderização das tarefas.
Para resolver isso, foi implementada uma lógica no decorator que permite exibir o nome do colaborador mesmo quando ele está desativado.
Essa solução pode ser observada no arquivo decorators/task_decorator.rb, e sua aplicação está na view views/task/_task.html.erb.

Em resumo, inclua pelo menos 5 conceitos que utilizou, a justificativa de cada um e como isso te ajudou no projeto.

