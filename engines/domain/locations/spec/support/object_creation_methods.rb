module Locations
  module ObjectCreationMethods
    def create_location(args)
      Locations::Location.create!(args)
    end
  end
end