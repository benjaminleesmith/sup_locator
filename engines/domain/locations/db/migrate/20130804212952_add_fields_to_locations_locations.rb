class AddFieldsToLocationsLocations < ActiveRecord::Migration
  def change
    add_column :locations_locations, :suggested_boards, :text
    add_column :locations_locations, :required_skill_level, :text
    add_column :locations_locations, :directions, :text
  end
end
