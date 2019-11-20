class AddExtraFieldsToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :home_type, :string
    add_column :rooms, :room_type, :string
    add_column :rooms, :adult, :integer
    add_column :rooms, :kids, :integer
    add_column :rooms, :bathroom, :integer
    add_column :rooms, :bedroom, :integer
  end
end
