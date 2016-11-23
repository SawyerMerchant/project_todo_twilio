Rails.application.routes.draw do

  root 'tasks#index'
  resources :tasks
  get 'remind/:id', to: 'texts#send_text'

end
