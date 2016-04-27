require 'rails_helper'

RSpec.describe Api::V1::RestaurantRecommendationsController, type: :controller do
  it "user sees list of restaurants based on their food preferences" do
    VCR.use_cassette 'user_restaurant_recommendations' do
      user = SlackUser.create(name: "Nick",
                       slack_id: "BHGS98HKN",
                       food_preferences: {"guac" => true, "pizza" => true})

      post :index, {user_id: "BHGS98HKN", text: ""}

      expect(response.status).to eq 200
    end
  end
end
