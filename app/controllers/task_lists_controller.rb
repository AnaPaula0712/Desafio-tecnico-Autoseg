class TaskListsController < ApplicationController
  # Tarefa 2
  # Itens 2.2 e 2.3 - Criação de um relatório das Tasks completas do User, listando os comentários em ordem alfabética

  def index
    @tasks = Task.where(user: current_user).order(created_at: :desc)
    @comments = Comment.where(user: current_user).order(body: :asc)
  end
end
