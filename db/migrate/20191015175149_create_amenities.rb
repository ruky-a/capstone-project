class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
    t.string  :hometype
    t.string  :roomtype
    t.integer :accommodate
    t.integer :bathroom
    t.integer :bedroom
    t.boolean :swimming
    t.boolean :air
    t.boolean :tv
    t.boolean :kitchen
    t.boolean :restaurant
    t.boolean :internet
    t.integer :room_id
      t.timestamps
    end
     add_index :amenities, :room_id
  end
end
