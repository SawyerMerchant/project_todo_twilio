Rails.application.routes.draw do

  root 'tasks#index'
  resources :tasks, only: [:show, :new, :create]

end
