module TaskListsHelper
  # Tarefa 2
  # Itens 2.2 e 2.3 - Criação de um relatório das Tasks completas do User, listando os comentários em ordem alfabética
  # Filtro para que apenas as Tasks com status "complete" sejam exibidas no relatório.
  
  def complete_tasks_comments
    @comments.select { |comment| comment.task.status == 'complete' }
  end
end
