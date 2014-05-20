class AddDeletionReasonToLocationsLocations < ActiveRecord::Migration
  def change
    add_column :locations_locations, :deletion_reason, :string, default: nil
  end
end
