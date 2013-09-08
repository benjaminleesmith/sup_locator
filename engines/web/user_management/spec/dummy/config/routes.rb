Rails.application.routes.draw do

  mount UserManagement::Engine => "/user_management"

  root to: "user_management/users#new"
end
