module UserLocationManagement
  class LocationsController < ApplicationController
    def index
      @locations = Locations::Location.where(user_id: current_user.id, deleted: false)
    end

    def destroy
      location = Locations::Location.find_by_id(params[:id])
      
      if location
        if location.user_id == current_user.id
          location.deleted = true
          location.save
        else
          flash[:error] = "You do not have permission to delete that Location"
        end
      else
        flash[:error] = "Invalid Location"
      end

      redirect_to locations_url
    end
  end
end