require 'rails_helper'

RSpec.describe SlackUser, type: :model do
  it "slack user can be created" do
    user_params = {name: "Nick",
                   real_name: "No Naps",
                   id: "U09U4THDZ",
                   is_admin: false,
                   profile: {
                     image_24: "google.com",
                     email: "nonaps@gmail"
                     }}
    usergroup = UserGroup.create(name: "Peoples",
                                 team_id: "S0KHTPHNE")
    SlackUser.create_or_find_slack_user(user_params, usergroup)
    user = usergroup.slack_users.first

    expect(user.username).to eq "Nick"
    expect(user.name).to eq "No Naps"
    expect(user.slack_id).to eq "U09U4THDZ"
    expect(user.email).to eq "nonaps@gmail"
  end

  it "newly created slack user can be found" do
    usergroup = UserGroup.create(name: "Peoples",
                                 team_id: "S0KHTPHNE")
    SlackUser.create(name: "Nicholas",
                     email: "nonaps4life@hotmail",
                     slack_id: "U09U4THHG",
                     user_group_id: usergroup.id)
    user_params = {id: "U09U4THHG"}

    user = SlackUser.create_or_find_slack_user(user_params, usergroup)

    expect(user.name).to eq "Nicholas"
    expect(user.slack_id).to eq "U09U4THHG"
    expect(user.email).to eq "nonaps4life@hotmail"
  end
end
