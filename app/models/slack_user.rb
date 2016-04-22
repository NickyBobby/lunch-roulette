class SlackUser < ActiveRecord::Base
  belongs_to :user_group

  def self.create_or_find_slack_user(slack_user)
    SlackUser.find_or_create_by(slack_id: slack_user[:id]) do |user|
      user.username = slack_user[:name]
      user.name     = slack_user[:real_name]
      user.slack_id = slack_user[:id]
      user.image    = slack_user[:image_24]
      user.email    = slack_user[:email]
      user.admin    = slack_user[:is_admin]
    end
  end
end
