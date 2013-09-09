module GuestLocationViewer
  class LocationsController < ApplicationController
    def index
      @locations_by_state_abbreviation = Locations::Location.all_grouped_by_state
    end

    def show
      @standing_wave = Locations::Location.find(params[:id])
    end
  end
end