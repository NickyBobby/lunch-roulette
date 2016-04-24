class AddDeletedColumnToSlackUsers < ActiveRecord::Migration
  def change
    add_column :slack_users, :active, :boolean, default: true
  end
end
