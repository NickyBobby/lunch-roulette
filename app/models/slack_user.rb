class SlackUser < ActiveRecord::Base
  belongs_to :user_group

  scope :is_admin, -> { where(active: true).where(admin: true).order('RANDOM()') }
  scope :is_student, -> { where(active: true).where(admin: false).order('RANDOM()') }

  def self.create_or_find_slack_user(slackuser, usergroup)
    usergroup.slack_users.find_or_create_by(slack_id: slackuser[:id]) do |user|
      user.username = slackuser[:name]
      user.name     = slackuser[:real_name]
      user.slack_id = slackuser[:id]
      user.image    = slackuser[:profile][:image_72]
      user.email    = slackuser[:profile][:email]
      user.admin    = slackuser[:is_admin]
    end
  end
end
