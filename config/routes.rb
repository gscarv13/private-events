Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  # resources :sessions, only: %i[new create destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: 'new_session'
  delete 'login', to: 'sessions#destroy', as: 'destroy_session'

  root 'users#show'
end
