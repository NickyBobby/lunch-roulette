class UserGroupsController < ApplicationController
  def index
    UserGroup.find_or_create_user_groups(current_user)
    @user_groups = UserGroup.all
  end

  def show
    @user_group = UserGroup.find(params[:id])
    UserGroup.find_or_create_slack_users(@user_group, current_user)
    @slack_users = @user_group.slack_users
  end
end
