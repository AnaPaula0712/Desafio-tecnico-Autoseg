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

<h2><b>Desafio Técnico realizado por Ana Paula Campos Westphalen no âmbito do processo seletivo da empresa Autoseg.</b></h2>

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

![Slide11](https://user-images.githubusercontent.com/89048640/151803900-98b72a6b-c849-4b4e-86f1-329b07d1e034.JPG)

![Slide12](https://user-images.githubusercontent.com/89048640/151803902-13f79fb2-f14a-4604-8bdd-da699335483e.JPG)

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

![Slide9](https://user-images.githubusercontent.com/89048640/151804146-000aca11-b954-4777-8c76-06ecbc576347.JPG)

![Slide10](https://user-images.githubusercontent.com/89048640/151801168-46568317-48ca-4d0e-8db1-74ad340e8ff1.JPG)

2.4. - Crie um spec de integração para o relatório.

Resposta: spec/requests/task_lists_spec.rb
           describe 'Complete task list'
                it 'Verify list of Tasks'
                it ' Verify list of Comments Alphabetically'
                it 'Returns only tasks with "complete" status

![Slide1](https://user-images.githubusercontent.com/89048640/151802273-6a9a4d8d-53df-41ba-a785-2aba6fbe3cf4.JPG)

### Tarefa 3

3 - Crie um CRUD de tarefas em tasks/new;
  Resposta: 
  
  Controller:   app/controllers/tasks_controller.rb
 
  Views:  
  
  Método index - app/views/tasks/index.html.erb
                    
  ![Slide2](https://user-images.githubusercontent.com/89048640/151802921-0a7856cb-dcca-4539-8f71-603d4360304e.JPG)
                    
  Método show - app/views/tasks/show.html.erb
                    
  ![Slide3](https://user-images.githubusercontent.com/89048640/151802958-6258dc7c-6f75-452e-9cb0-7188992b6363.JPG)                   
                    
  Métodos new e create - app/views/tasks/new.html.erb
   
  ![Slide5](https://user-images.githubusercontent.com/89048640/151803444-55909674-d1ff-4460-8b56-5ca83c8a8804.JPG)
                    
  Métodos edit e update - app/views/tasks/edit.html.erb
   
  ![Slide4](https://user-images.githubusercontent.com/89048640/151802965-1af0cbed-7f6f-4a58-b060-d8d0639663d2.JPG)
  
  Método destroy
  
  ![Slide6](https://user-images.githubusercontent.com/89048640/151804652-d0856188-4348-4d68-b7e9-920b2d2b74cf.JPG)

  Outras ações realizadas no âmbito dessa tarefa, dentro do controller Comments:
  
  Criação de um novo comentário - Método new e create no Comments controller
  
  ![Slide7](https://user-images.githubusercontent.com/89048640/151805366-9d310248-b093-43c6-954f-9746bd0a41cd.JPG)
  
  Exibição de todos os comentários de um usuário - Método index no Comments controller
  
  ![Slide8](https://user-images.githubusercontent.com/89048640/151805371-7c9820b3-bdd8-4f5f-8d07-eb9455e35340.JPG)
  
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

  ![Slide2](https://user-images.githubusercontent.com/89048640/151805565-8a5939bb-680a-4c12-8cdb-265f8f2a735f.JPG)

### Boa sorte

Caso tenha dúvidas, por gentileza entre em contato com a Equipe AutoSeg :)
### Observações
- Não é necessário realizar o deploy do projeto no Heroku.
- Crie um projeto em seu Github e suba o projeto lá após a finalização.
- Não dê um fork / suba um PR em nosso repositório.
# mini-app
