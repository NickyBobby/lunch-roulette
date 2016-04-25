class RestaurantRecommendationsController < ApplicationController
  def index
    @restaurants = service.get_restaurant_recommendations(current_user)
    restaurant_names = get_restaurant_names(@restaurants.businesses)
    render json: restaurant_names
  end

  private

    def service
      @service ||= YelpService.new
    end
end
