require 'rails_helper'

RSpec.describe SlackUsersController, type: :controller do
  it "user can add food to their preferences" do
    usergroup = UserGroup.create
    user = SlackUser.create(name: "Nick",
                            slack_id: "BHGS98HKN",
                            user_group_id: usergroup.id)

    delete :destroy, {id: user.id}

    expect(response.status).to eq 302
  end
end
