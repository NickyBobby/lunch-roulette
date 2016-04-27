require 'rails_helper'

RSpec.describe Api::V1::FoodPreferencesController, type: :controller do
  it "user can add food to their preferences" do
    user = SlackUser.create(name: "Nick",
                     slack_id: "BHGS98HKN")

    post :update, {user_id: "BHGS98HKN", text: "#add stuff"}

    expect(response.status).to eq 200
    expect(response.body).to have_content "stuff was added to your food preferences"
  end

  it "user can delete food from their preferences" do
    user = SlackUser.create(name: "Nick",
                     slack_id: "BHGS98HKN",
                     food_preferences: {"stuff" => true})

    post :update, {user_id: "BHGS98HKN", text: "#delete stuff"}

    expect(response.status).to eq 200
    expect(response.body).to have_content "stuff was deleted from your food preferences"
  end

  it "user can see all of their food preferences" do
    user = SlackUser.create(name: "Nick",
                     slack_id: "BHGS98HKN",
                     food_preferences: {"stuff" => true, "things" => true})

    post :update, {user_id: "BHGS98HKN", text: "#list"}

    expect(response.status).to eq 200
    expect(response.body).to have_content "Your food preferences are stuff and things"
  end

  it "user can see help for using the slash command" do
    user = SlackUser.create(name: "Nick",
                     slack_id: "BHGS98HKN",
                     food_preferences: {"stuff" => true, "things" => true})

    post :update, {user_id: "BHGS98HKN", text: ""}

    expect(response.status).to eq 200
    expect(response.body).to have_content "Possible commands when using the /food-prefs slash command"
  end
end
