UserManagement::Engine.routes.draw do
  resources :users, only: [:new, :create]
end
