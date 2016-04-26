require 'rails_helper'

RSpec.describe Api::V1::LunchRouletteGroupsController, type: :controller do
  it "returns list of lunch roulette groups" do
    10.times do |n|
      SlackUser.create(name: "Teacher #{n}", admin: true)
    end
    43.times do |n|
      SlackUser.create(name: "Student #{n}", admin: false)
    end

    get :index , {default: :json}

    expect(response.status).to eq 200
  end
end
