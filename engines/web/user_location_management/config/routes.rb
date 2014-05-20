UserLocationManagement::Engine.routes.draw do
  resources :lakes, only: [:new, :create, :edit, :update]
  resources :rivers, only: [:new, :create, :edit, :update]
  resources :standing_waves, only: [:new, :create, :edit, :update]
  resources :surf_breaks, only: [:new, :create, :edit, :update]
  resources :locations, only: [:index, :create, :edit, :update, :destroy] do
    member do
      get :destroy_confirmation
    end
  end
end
