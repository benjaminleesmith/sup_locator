module Locations
  module ObjectCreationMethods
    def create_location(args)
      Locations::Location.create!(args)
    end

    def create_standing_wave(args)
      defaults = {
          name: "standing wave ##{count}"
      }
      Locations::StandingWave.create!(defaults.merge(args))
    end

    def count
      @@count = 0 unless defined? @@count
      @@count += 1
    end
  end
end