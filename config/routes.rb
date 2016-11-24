Rails.application.routes.draw do

  root 'tasks#index'
  resources :tasks do
    resources :texts, only: :create
    resources :task_completions, only: :create
  end

end
