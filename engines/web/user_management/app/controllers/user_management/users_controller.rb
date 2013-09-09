require_dependency "user_management/application_controller"

module UserManagement
  class UsersController < ApplicationController
    def new
      session[:return_to] = request.referrer
      @user = Users::User.new
    end

    def create
      @user = Users::User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Thanks for signing up!"
        redirect_back_or_default(new_user_url)
      else
        flash.now[:error] = "We were unable to create an account for you."
        render "new"
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
