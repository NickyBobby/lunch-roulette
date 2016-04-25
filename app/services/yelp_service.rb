require 'yelp'

class YelpService
  # client = Yelp::Client.new({ consumer_key: ENV['YELP_CONSUMER_KEY'],
  #                             consumer_secret: ENV['YELP_CONSUMER_SECRET'],
  #                             token: ENV['YELP_TOKEN'],
  #                             token_secret: ENV['YELP_TOKEN_SECRET']
  #                           })

  def get_restaurant_recommendations(user)
    parameters = { term: "Pizza", limit: 15 }
    Yelp.client.search('1510 Blake St. Denver CO 80202', parameters)
  end

end
