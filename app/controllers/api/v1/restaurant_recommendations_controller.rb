class Api::V1::RestaurantRecommendationsController < Api::V1::BaseController

  def index
    user_preferences = SlackUser.get_user_preferences(params)
    restaurants = Restaurant.get_recommendations(user_preferences)
    restaurant_info = Restaurant.get_restaurant_info(restaurants)
    render json: restaurant_info
  end
end
