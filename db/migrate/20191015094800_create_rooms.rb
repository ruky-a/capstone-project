class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :listing_name
      t.text :description
      t.string :address
      t.integer :rate
      t.integer :user_id
      t.timestamps
    end
    add_index :rooms, :user_id
  end
end
