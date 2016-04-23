class AddReferenceToSlackUser < ActiveRecord::Migration
  def change
    add_reference :slack_users, :user_group, index: true, foreign_key: true
  end
end
