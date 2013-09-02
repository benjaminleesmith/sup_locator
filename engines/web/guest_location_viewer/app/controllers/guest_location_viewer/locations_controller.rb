module GuestLocationViewer
  class LocationsController < ApplicationController
    def index
      @locations = Locations::Location.all
    end

    def show
      @standing_wave = Locations::Location.find(params[:id])
    end
  end
end