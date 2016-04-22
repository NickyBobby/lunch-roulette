class UserGroup < ActiveRecord::Base
  has_many :slack_users
  
  def self.generate_user_group(group_info)
    UserGroup.find_or_create_by(team_id: group_info[:id]) do |usergroup|
      usergroup.team_id    = group_info[:id]
      usergroup.name       = group_info[:name]
      usergroup.user_count = group_info[:user_count]
      usergroup.user_group = group_info[:handle]
    end
  end
end
