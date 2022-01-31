## Challenge AutoSeg


### TaskManager App
Considere o app deste projeto já estruturado, onde nele conseguimos cadastrar tarefas do dia-a-dia a serem realizadas, junto com uma descrição, colocar comentários e algumas outras features :)
  Então... considere a atual estrutura de model já existente:

  ```
                ____________
               | User       |
        _____* | - email    |
       /       | - password |
      /        |____________|
     /
    *
 _______________              __________
| Tasks         |            | Comments |
| - title       |1 -------- *| - body   |
| - description |            | - status |
| - status      |            | - score  |
| - priority    |            | - like   |
| - share       |            |__________|
|_______________|
```
### Instruções para o challenge
0 - Versão do Ruby
`ruby 2.7.1`
1 - Clone o projeto
```console
$ git clone git@github.com:autoseg/mini-app.git
```
2 - Build o projeto e roda os seeds
```console
$ bundle install
$ bundle exec rails db:create db:migrate db:seed
$ yarn install --check-files
$ rails s
```
3 - Ao acessar a aplicação, crie uma conta.
### Tarefa 1
1 - Logo na sequência que criou a conta no passo anterior, será necessário criar um perfil.
Porém há um bug nesta feature, a atividade da tarefa 1 é tentar identificá-lo e corrigir.

Resposta:
1.1 - IDENTIFICAÇÃO DO BUG: Mesmo preenchendo os dados do profile ele não era exibido, pois a action create não recebia os parameters,
já que o método "profile_params" estava vazio.
CORREÇÃO: Após a adição dos parameters o app passou a criar o perfil.

1.2 - Outras ações realizadas neste controller:
- acionamento do método "find_profile" como "before_action",
- implementação dos métodos "show" e "edit", alteração do método "change_privacy" e
- implementação dos Strong parameters através do método "profile_params".

### Tarefa 2
2 - Para esta tarefa é necessário a execução do seeds antes, certifique-se que você populou o banco de dados.
2.1 - Esta atividade é para ser criado um relatório de todas as Tarefas, onde listaremos algo semelhante ao exemplo abaixo:
___________________________________
| Tasks (ID) | Comments | Status   |
|------------|----------|----------|
| 1          | Aaaaaa   | complete |
| 2          | Bbbbbb   | complete |


2.2. - Para isto, crie:
 - Um controller;
  Resposta: Task_Lists Controller
 - Uma rota;
  Resposta: /task_lists(.:format)
 - Uma view;
  Resposta: app/views/task_lists/index.html.erb
            http://localhost:3000/task_lists

2.3. - Exiba um relatório das Tasks completas do User, e liste todos os comentários em ordem alfabética conforme o exemplo acima.
Resposta: http://localhost:3000/task_lists

2.4. - Crie um spec de integração para o relatório.
Resposta: spec/requests/task_lists_spec.rb
           describe 'Complete task list'
                it 'Verify list of Tasks'
                it ' Verify list of Comments Alphabetically'
                it 'Returns only tasks with "complete" status'

### Tarefa 3

3 - Crie um CRUD de tarefas em tasks/new;
  Resposta: Controller:   app/controllers/tasks_controller.rb
            Views:  app/views/tasks/index.html.erb
                    app/views/tasks/show.html.erb
                    app/views/tasks/new.html.erb
                    app/views/tasks/edit.html.erb

  3.1 - Temos o arquivo deste spec vazio, escreva o(s) spec(s) de integração;
    Resposta: spec/models/task_spec.rb
              - Spec de integração da atualização de uma Task
                      context 'Update a task' / it 'Verify Edit Task'
              - Spec de integração da exibição de uma Task específica
                      context 'Show Task' / it 'View a specific task'

  3.2 - Crie um spec unitário.
    Resposta: spec/models/task_spec.rb
              - Spec unitário da criação de uma nova Task
                      context 'Creating a new task' / it 'Verify New Task'


### Boa sorte

Caso tenha dúvidas, por gentileza entre em contato com a Equipe AutoSeg :)
### Observações
- Não é necessário realizar o deploy do projeto no Heroku.
- Crie um projeto em seu Github e suba o projeto lá após a finalização.
- Não dê um fork / suba um PR em nosso repositório.
