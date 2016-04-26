require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  it "usergroup can be created" do
    user_group_params = {id: "HADJN0FDD",
                         name: "Fun Times",
                         user_count: 17,
                         handle: "fun-times"}
    user_group = UserGroup.generate_user_group(user_group_params)

    expect(user_group.team_id).to eq "HADJN0FDD"
    expect(user_group.name).to eq "Fun Times"
    expect(user_group.user_count).to eq 17
    expect(user_group.user_group).to eq "fun-times"
  end
end
