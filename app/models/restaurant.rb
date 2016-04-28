class Restaurant
  attr_reader :name, :address, :rating

  def initialize(restaurant)
    @name    = restaurant.name
    @address = restaurant.location.display_address
    @rating  = restaurant.rating
  end

  def self.get_recommendations(preferences)
    Restaurant.service.get_restaurant_recommendations(preferences).businesses
  end

  def self.get_restaurant_info(restaurant_params)
    restaurants = []
    restaurants = restaurant_params.map do |restaurant|
      restaurants << Restaurant.new(restaurant)
    end
    restaurant_results = Restaurant.get_restaurant_results(restaurants.first)
    {text: restaurant_results}
  end

  def self.get_restaurant_results(restaurants)
    restaurants.map do |restaurant|
      "* #{restaurant.name} - #{restaurant.rating} Rating - #{restaurant.address.join(" ")}"
    end.shuffle.shift(10).join("\n")
  end

  private

    def self.service
      @service ||= YelpService.new
    end
end
