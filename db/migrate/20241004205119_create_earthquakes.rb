class CreateEarthquakes < ActiveRecord::Migration[7.2]
  def change
    create_table :earthquakes do |t|
      t.string :location
      t.decimal :magnitude
      t.decimal :depth
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
