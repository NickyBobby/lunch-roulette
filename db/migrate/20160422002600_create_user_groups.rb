class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :team_id
      t.string :name
      t.integer :user_count

      t.timestamps null: false
    end
  end
end
