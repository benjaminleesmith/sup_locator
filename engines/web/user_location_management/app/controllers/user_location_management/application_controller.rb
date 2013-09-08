module UserLocationManagement
  class ApplicationController < SharedUi::ApplicationController
    before_filter :require_authenicated

    def require_authenicated
      flash[:notice] = "Please login to access that page."
      redirect_to "/" unless current_user
    end
  end
end
