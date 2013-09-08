require_dependency "user_management/application_controller"

module UserManagement
  class SessionsController < ApplicationController
    def new
    end

    def create
      user = Users::User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/"
      else
        render "new"
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to "/"
    end
  end
end
