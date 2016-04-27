class Api::V1::FoodPreferencesController < Api::V1::BaseController

  def update
    @slack_user = SlackUser.find_by(slack_id: params[:user_id])
    if params[:text].include?('#add')
      render json: {text: "#{add_food} was added to your food preferences ;)"}
    elsif params[:text].include?('#delete')
      render json: {text: "#{delete_food} was deleted from your food preferences :("}
    elsif params[:text].include?('#list')
      render json: {text: "Your food preferences are #{foods}"}
    else
      render json: {text: help}
    end
  end

  private

    def add_food
      @slack_user.food_preferences["#{food}"] = true
      @slack_user.save
      food
    end

    def delete_food
      @slack_user.food_preferences.delete("#{food}")
      @slack_user.save
      food
    end

    def food
      params[:text].split(" ")[1]
    end

    def foods
      @slack_user.food_preferences.keys.join(" and ")
    end

    def help
      "Possible commands when using the /food-prefs slash command\n
      /food-prefs #add [food_name]     | will add food or dietary restriction to your preferences \n
      /food-prefs #delete [food_name]  | will remove food from your preferences \n
      /food-prefs #list                | will return list of your food preferences \n
      '#add' and '#delete' commands will only accept the first word after it"
    end
end
