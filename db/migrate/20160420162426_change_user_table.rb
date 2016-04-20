class ChangeUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :vegetarian,        :boolean
    add_column    :users, :vegetarian_at,     :datetime
    remove_column :users, :vegan,             :boolean
    add_column    :users, :vegan_at,          :datetime
    remove_column :users, :gluten_free,       :boolean
    add_column    :users, :gluten_free_at,    :datetime
    add_column    :users, :image_url,         :string
    add_column    :users, :admin_at,          :datetime
    add_column    :users, :uid,               :string
  end
end
