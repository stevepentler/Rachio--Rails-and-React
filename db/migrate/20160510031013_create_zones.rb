class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :zone_id
      t.references :device, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
