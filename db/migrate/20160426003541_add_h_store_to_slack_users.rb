class AddHStoreToSlackUsers < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :slack_users, :food_preferences, :hstore, default: '', null: false
  end
end
