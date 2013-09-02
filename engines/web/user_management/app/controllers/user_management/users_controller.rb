require_dependency "user_management/application_controller"

module UserManagement
  class UsersController < ApplicationController
    def new
      @user = Users::User.new
    end

    def create
      @user = Users::User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_back_or_default(new_user_url)
      else
        render "new"
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
