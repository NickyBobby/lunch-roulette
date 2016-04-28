class Restaurant
  attr_reader :name, :address, :rating

  def initialize(restaurant)
    @name    = restaurant.name
    @address = restaurant.location.display_address
    @rating  = restaurant.rating
  end
end
