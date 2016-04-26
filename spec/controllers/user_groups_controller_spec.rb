require 'rails_helper'

RSpec.describe UserGroupsController, type: :controller do
  it "shows all user groups" do
    VCR.use_cassette 'get_all_user_groups' do
      user = User.create(first_name: "Nick", token: ENV['SLACK_USER_TOKEN'])
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      get :index

      expect(response.status).to eq 200

      expect(UserGroup.count).to eq 26
    end
  end

  it "show all users within one user group" do
    VCR.use_cassette 'get_all_users_from_one_group' do
      user = User.create(first_name: "Nick", token: ENV['SLACK_USER_TOKEN'])
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      usergroup = UserGroup.create(team_id: "S0KHTPHNE")
      
      get :show, {id: usergroup.id}

      expect(response.status).to eq 200
    end
  end
end
