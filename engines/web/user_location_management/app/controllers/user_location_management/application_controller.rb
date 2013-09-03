module UserLocationManagement
  class ApplicationController < ActionController::Base
    before_filter :require_authenicated

    def require_authenicated
      flash[:notice] = "Please login to access that page."
      redirect_to "/" unless current_user
    end

    def current_user
      @current_user ||= Users::User.find(session[:user_id]) if session[:user_id]
    end
  end
end
