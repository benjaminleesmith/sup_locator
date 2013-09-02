class CreateLocationsLocations < ActiveRecord::Migration
  def change
    create_table :locations_locations do |t|
      t.string :type
      t.string :name
      t.text :description
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
