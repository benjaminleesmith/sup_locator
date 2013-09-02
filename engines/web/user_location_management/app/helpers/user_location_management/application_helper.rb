module UserLocationManagement
  module ApplicationHelper
    def view_location_path(location)
      case location.class.to_s
        when "Locations::Lake"
          lake_path(location)
        when "Locations::River"
          river_path(location)
        when "Locations::StandingWave"
          standing_wave_path(location)
        when "Locations::SurfBreak"
          surf_break_path(location)
        else
          "unknonwn"
      end
    end
  end
end
