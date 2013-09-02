GuestLocationViewer::Engine.routes.draw do
  resources :locations, only: [:index, :show]
end
