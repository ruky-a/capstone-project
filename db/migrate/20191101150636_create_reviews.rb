class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :message
      t.integer :rating
      t.integer :user_id
      t.integer :room_id
      t.integer :reservation_id
      t.timestamps
    end
    add_index :reviews, [:user_id, :room_id, :reservation_id]
    add_index :reviews, :room_id
  end
end
