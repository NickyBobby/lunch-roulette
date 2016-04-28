module YelpHelper
  def get_restaurant_info(restaurant_params)
    restaurants = []
    restaurants = restaurant_params.map do |restaurant|
      restaurants << Restaurant.new(restaurant)
    end
    restaurant_results = get_restaurant_results(restaurants.first)
    {text: restaurant_results.join("\n")}
  end

  def get_restaurant_results(restaurants)
    restaurants.map do |restaurant|
      "* #{restaurant.name} - #{restaurant.rating} Rating - #{restaurant.address.join(" ")}"
    end.shuffle.shift(10)
  end

end
