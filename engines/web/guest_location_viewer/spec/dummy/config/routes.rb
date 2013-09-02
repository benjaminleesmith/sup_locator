Rails.application.routes.draw do

  mount GuestLocationViewer::Engine => "/guest_location_viewer"
end
