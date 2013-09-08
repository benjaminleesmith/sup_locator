module UserLocationManagement
  class StandingWavesController < ApplicationController
    def new
      @standing_wave = Locations::StandingWave.new
    end

    def create
      @standing_wave = Locations::StandingWave.new(standing_wave_params.merge({user_id: current_user.id}))

      if @standing_wave.save
        redirect_to locations_url
      else
        render "new"
      end
    end

    def edit
      @standing_wave = Locations::StandingWave.where(id: params[:id], user_id: current_user.id).first
    end

    def update
      @standing_wave = Locations::StandingWave.where(id: params[:id], user_id: current_user.id).first

      if @standing_wave.update_attributes(standing_wave_params)
        redirect_to locations_url
      else
        render "new"
      end
    end

    private

    def standing_wave_params
      params.require(:standing_wave).permit(:name, :description, :suggested_boards, :suggested_skill_level, :directions, :state_abbreviation)
    end
  end
end