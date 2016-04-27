module YelpHelper
  def get_restaurant_names(restaurants)
    restaurant_names = []
    restaurants.each do |restaurant|
      restaurant_names << "* " + restaurant.name
    end
    restaurants = restaurant_names.shuffle.shift(10)
    {text: restaurants.join("\n")}
  end

end
