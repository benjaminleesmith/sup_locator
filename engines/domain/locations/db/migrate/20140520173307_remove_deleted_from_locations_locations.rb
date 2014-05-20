class RemoveDeletedFromLocationsLocations < ActiveRecord::Migration
  def change
    remove_column :locations_locations, :deleted
  end
end
