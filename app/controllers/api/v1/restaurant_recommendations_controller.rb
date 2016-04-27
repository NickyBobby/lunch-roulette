class Api::V1::RestaurantRecommendationsController < Api::V1::BaseController
  include YelpHelper
  
  def index
    user_preferences = get_user_preferences(params)
    @restaurants = service.get_restaurant_recommendations(user_preferences)
    restaurant_names = get_restaurant_names(@restaurants.businesses)
    render json: restaurant_names
  end

  private

    def service
      @service ||= YelpService.new
    end

    def get_user_preferences(info)
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
end
