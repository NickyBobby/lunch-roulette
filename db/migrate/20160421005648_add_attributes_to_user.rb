class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :vegetarian_at, :timestamp
    add_column :users, :vegan_at, :timestamp
    add_column :users, :gluten_free_at, :timestamp
  end
end
