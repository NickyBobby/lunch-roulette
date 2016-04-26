require 'yelp'

class YelpService

  def get_restaurant_recommendations(user)
    parameters = { term: "Pizza", limit: 15 }
    Yelp.client.search('1510 Blake St. Denver CO 80202', parameters)
  end

end
