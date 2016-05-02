require 'rails_helper'

RSpec.describe Api::V1::LunchRouletteGroupsController, type: :controller do
  it "returns list of lunch roulette groups" do
    10.times do |n|
      SlackUser.create(name: "Teacher #{n}", admin: true)
    end
    43.times do |n|
      SlackUser.create(name: "Student #{n}", admin: false)
    end

    get :index, format: :json

    expect(response).to have_http_status(:success)
  end

  it "returns list of lunch roulette groups / hits different conditional" do
    10.times do |n|
      SlackUser.create(name: "Teacher #{n}", admin: true)
    end
    44.times do |n|
      SlackUser.create(name: "Student #{n}", admin: false)
    end

    get :index, format: :json

    expect(response).to have_http_status(:success)
  end
end
