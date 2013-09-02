module UserLocationManagement
  class LocationsController < ApplicationController
    def index
      @locations = Locations::Location.where(user_id: current_user.id)
    end
  end
end