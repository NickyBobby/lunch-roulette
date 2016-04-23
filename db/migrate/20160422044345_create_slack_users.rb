class CreateSlackUsers < ActiveRecord::Migration
  def change
    create_table :slack_users do |t|
      t.string  :username
      t.string  :name
      t.string  :slack_id
      t.string  :image
      t.string  :email
      t.boolean :admin
      t.timestamps null: false
    end
  end
end
