module UserLocationManagement
  class LocationsController < ApplicationController
    before_filter :load_location, only: [:destroy_confirmation, :destroy]

    def index
      @locations = Locations::Location.where(user_id: current_user.id, deletion_reason: nil)
    end

    def destroy_confirmation
    end

    def destroy
      @location.deletion_reason = params[:deletion_reason]
      unless @location.save
        flash[:error] = "Unable to delete Location (#{@location.errors.full_messages.join(", ")})"
      end
      redirect_to locations_url
    end

    private

    def load_location
      @location = Locations::Location.find_by_id(params[:id])
      if !@location
        flash[:error] = "Invalid Location"
        redirect_to locations_url
      elsif @location.user_id != current_user.id
        flash[:error] = "You do not have permission to delete that Location"
        redirect_to locations_url
      end
    end
  end
end