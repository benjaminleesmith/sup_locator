class AddStateAbbreviationToLocationsLocations < ActiveRecord::Migration
  def change
    add_column :locations_locations, :state_abbreviation, :string
  end
end
