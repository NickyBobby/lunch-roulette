class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name,    :string
    add_column :users, :last_name,     :string
    add_column :users, :vegetarian,    :boolean
    add_column :users, :vegan,         :boolean
    add_column :users, :gluten_free,   :boolean
    add_column :users, :favorite_food, :string
  end
end
