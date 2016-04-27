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
        click_on "Logout"
        expect(page).to have_content("Sign in with Slack")
      end
    end
  end
end
