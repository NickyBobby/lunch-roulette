class UserGroupsController < ApplicationController
  def index
    user_groups = service.get_user_groups
    create_user_groups(user_groups)
    @user_groups = UserGroup.all
  end

  def show
    @user_group = UserGroup.find(params[:id])
    slack_users = service.get_slack_users(@user_group)
    create_slack_users(slack_users) if slack_users[:users].count != @user_group.slack_users.count
    @slack_users = @user_group.slack_users
  end

  private

    def service
      @service ||= SlackService.new(current_user)
    end

    def create_user_groups(user_groups)
      usergroups = user_groups[:usergroups]
      usergroups.each do |usergroup|
        UserGroup.generate_user_group(usergroup)
      end
    end

    def create_slack_users(slack_users)
      slackusers = slack_users[:users]
      slackusers.each do |slack_user_id|
        slack_user = service.get_slack_user_info(slack_user_id)
        SlackUser.create_or_find_slack_user(slack_user[:user], @user_group)
      end
    end
end
