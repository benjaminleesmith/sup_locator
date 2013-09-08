module GuestLocationViewer
  class ApplicationController < SharedUi::ApplicationController
    layout "shared_ui/application"

    before_filter :current_user
  end
end
