require 'yelp'

class YelpService

  def get_restaurant_recommendations(user_preferences)
    parameters = { term: "#{user_preferences}", limit: 20 }
    Yelp.client.search('1510 Blake St. Denver CO 80202', parameters)
  end

end
