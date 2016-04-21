require 'rails_helper'

RSpec.feature "user can log in" do
  context "user can log in" do
    scenario "logged in user sees user info page" do
      VCR.use_cassette('slack#user_info') do
        stub_omniauth
        visit "/"
        click_on "Sign in with Slack"
        expect(page).to have_content("Nicholas Dorans")
        expect(page).to have_content("nickynonaps")
        expect(page).to have_content("Vegetarian: false")
        expect(page).to have_content("Vegan: false")
        expect(page).to have_content("Gluten Free: false")

      end
    end
  end
end
