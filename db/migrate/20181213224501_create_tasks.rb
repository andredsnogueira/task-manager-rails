class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :address
      t.integer :door_number
      t.string :postal_code
      t.datetime :start_hour
      t.datetime :end_hour
      t.integer :status
      t.datetime :deadline

      t.timestamps
    end
  end
end
