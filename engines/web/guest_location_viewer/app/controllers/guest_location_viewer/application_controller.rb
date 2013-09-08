module GuestLocationViewer
  class ApplicationController < ActionController::Base
    layout "shared_ui/application"

    before_filter :current_user

    def current_user
      @current_user ||= Users::User.find(session[:user_id]) if session[:user_id]
    end
  end
end
