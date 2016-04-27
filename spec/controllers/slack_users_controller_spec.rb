require 'rails_helper'

RSpec.describe SlackUsersController, type: :controller do
  it "admin can remove user from available lunch roulette group" do
    usergroup = UserGroup.create
    user = SlackUser.create(name: "Nick",
                            slack_id: "BHGS98HKN",
                            user_group_id: usergroup.id)

    get :destroy, {id: user.id}

    expect(response.status).to eq 302
  end

  it "admin can add user to available lunch roulette group" do
    usergroup = UserGroup.create
    user = SlackUser.create(name: "Nick",
                            slack_id: "BHGS98HKN",
                            user_group_id: usergroup.id)

    get :update, {id: user.id}

    expect(response.status).to eq 302
  end
end
