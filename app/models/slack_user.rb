class SlackUser < ActiveRecord::Base
  belongs_to :user_group

  def self.create_or_find_slack_user(slackuser, usergroup)
    usergroup.slack_users.find_or_create_by(slack_id: slackuser[:id]) do |user|
      user.username = slackuser[:name]
      user.name     = slackuser[:real_name]
      user.slack_id = slackuser[:id]
      user.image    = slackuser[:profile][:image_24]
      user.email    = slackuser[:profile][:email]
      user.admin    = slackuser[:is_admin]
    end
  end
end
