Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  resources :events, only: %i[new create show]

  get 'participate/:id', to: 'events#participate', as: 'participate'
  delete 'participate/:id', to: 'events#cancel_participation', as: 'destroy_participation'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: 'new_session'
  delete 'login', to: 'sessions#destroy', as: 'destroy_session'

  root 'events#index'
end
