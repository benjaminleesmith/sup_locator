module UserManagement
  class ApplicationController < SharedUi::ApplicationController
    layout "shared_ui/application"

    before_filter :current_user

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
  end
end
