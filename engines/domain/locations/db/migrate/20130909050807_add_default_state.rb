class AddDefaultState < ActiveRecord::Migration
  def change
    change_column_default :locations_locations, :state_abbreviation, ""
  end
end
