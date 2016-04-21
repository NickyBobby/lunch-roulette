class RemoveAttributesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :vegetarian_at, :datetime
    remove_column :users, :vegan_at, :datetime
    remove_column :users, :gluten_free_at, :datetime
  end
end
