Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  # Tarefa 2
  # Itens 2.2 e 2.3 - Criação de um relatório das Tasks completas do User, listando os comentários em ordem alfabética
  resources :tasks do
    resources :comments, only: %i[index new create]
  end
  resources :task_lists, only: [:index]

  resources :comments, only: %i[destroy]

  resources :profiles, only: %i[show new create update edit] do
    get 'private_page', on: :member
    post 'change_privacy', on: :member
    resources :comments, only: %i[index]
  end

  resources :pluses, only: %i[create destroy]
  resources :minuses, only: %i[create destroy]
end
