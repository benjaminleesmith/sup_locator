Rails.application.routes.draw do

  mount UserLocationManagement::Engine => "/user_location_management"
end
