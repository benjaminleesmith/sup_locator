class AddDeletedToLocationsLocations < ActiveRecord::Migration
  def change
    add_column :locations_locations, :deleted, :boolean, default: false
  end
end
