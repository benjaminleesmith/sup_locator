module SharedUi
  class ApplicationController < ActionController::Base
    def current_user
      @current_user ||= Users::User.find(session[:user_id]) if session[:user_id]
    end
  end
end
