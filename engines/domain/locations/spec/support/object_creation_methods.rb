module Locations
  module ObjectCreationMethods
    def create_location(args)
      Locations::Location.create!(args)
    end

    def create_standing_wave(args)
      Locations::StandingWave.create!(args)
    end
  end
end