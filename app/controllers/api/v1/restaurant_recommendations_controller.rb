class Api::V1::RestaurantRecommendationsController < Api::V1::BaseController

  def index
    user_preferences = SlackUser.get_user_preferences(params)
    render json: Restaurant.get_recommendations(user_preferences)
  end
end
