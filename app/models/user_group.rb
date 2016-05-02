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

  def self.find_or_create_user_groups(user)
    slack_service = UserGroup.service(user)
    user_groups = slack_service.get_user_groups
    UserGroup.create_user_groups(user_groups)
  end

  def self.find_or_create_slack_users(user_group, user=nil)
    slack_service = UserGroup.service(user)
    slack_users = slack_service.get_slack_users(user_group)
    UserGroup.create_slack_users(slack_users, user, user_group) if slack_users[:users].count != user_group.slack_users.count
  end

  private

    def self.service(user)
      @service ||= SlackService.new(user)
    end

    def self.create_user_groups(user_groups)
      usergroups = user_groups[:usergroups]
      usergroups.each do |usergroup|
        UserGroup.generate_user_group(usergroup)
      end
    end

    def self.create_slack_users(slack_users, user, user_group)
      slackusers = slack_users[:users]
      slack_service = UserGroup.service(user)
      slackusers.each do |slack_user_id|
        slack_user = slack_service.get_slack_user_info(slack_user_id)
        SlackUser.create_or_find_slack_user(slack_user[:user], user_group)
      end
    end
end
