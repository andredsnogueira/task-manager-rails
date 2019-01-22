class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.date :date
      t.float :lat
      t.float :long
      t.float :speed

      t.timestamps
    end
  end
end
