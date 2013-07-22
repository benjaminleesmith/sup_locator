Rails.application.routes.draw do

  mount UserManagement::Engine => "/user_management"

  root to: "users#new"
end
