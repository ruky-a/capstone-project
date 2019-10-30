class AddFieldsToRoom < ActiveRecord::Migration[5.2]
  def change
   add_column :rooms, :active, :boolean
     add_column :rooms, :price, :decimal
     add_column :rooms, :web_url, :string

  end
end
