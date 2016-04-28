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

  def self.get_user_preferences(info)
    prefs = []
    prefs << SlackUser.find_by(slack_id: info[:user_id]).food_preferences.keys.join(",")
    if !info[:text].empty?
      users = info[:text].split(" ")
      users.each do |user|
        if slackuser = SlackUser.find_by(username: user.gsub('@',''))
          prefs << slackuser.food_preferences.keys.join(",")
        end
      end
    end
    prefs.join(",")
  end

  def add_food(params)
    food = get_food(params)
    self.food_preferences["#{food}"] = true
    self.save
    food
  end

  def delete_food(params)
    food = get_food(params)
    self.food_preferences.delete("#{food}")
    self.save
    food
  end

  def get_food(params)
    params[:text].split(" ")[1]
  end

  def foods
    self.food_preferences.keys.join(" and ")
  end


end
