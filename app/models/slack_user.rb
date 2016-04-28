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

  def get_response(params)
    if params[:text].include?('#add')
      food = self.add_food(params)
      {text: "#{food} was added to your food preferences ;)"}
    elsif params[:text].include?('#delete')
      food = self.delete_food(params)
      {text: "#{food} was deleted from your food preferences :("}
    elsif params[:text].include?('#list')
      {text: "Your food preferences are #{self.foods}"}
    else
      {text: self.help}
    end
  end

  def add_food(params)
    food = self.get_food(params)
    self.food_preferences["#{food}"] = true
    self.save
    food
  end

  def delete_food(params)
    food = self.get_food(params)
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

  def help
    "Possible commands when using the /food-prefs slash command\n
    /food-prefs #add [food_name]     | will add food or dietary restriction to your preferences \n
    /food-prefs #delete [food_name]  | will remove food from your preferences \n
    /food-prefs #list                | will return list of your food preferences \n
    '#add' and '#delete' commands will only accept the first word after it"
  end

end
