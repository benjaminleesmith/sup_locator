module UserLocationManagement
  class ApplicationController < SharedUi::ApplicationController
    layout "shared_ui/application"

    before_filter :require_authenticated

    def require_authenticated
      flash[:notice] = "Please login to access that page."
      redirect_to "/" unless current_user
    end
  end
end
