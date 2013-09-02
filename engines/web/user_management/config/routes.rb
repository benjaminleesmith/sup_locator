UserManagement::Engine.routes.draw do
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]
end
