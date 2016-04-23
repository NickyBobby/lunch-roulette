class AddUserGroupColumnToUserGroup < ActiveRecord::Migration
  def change
    add_column :user_groups, :user_group, :string
  end
end
