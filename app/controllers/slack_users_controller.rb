class SlackUsersController < ApplicationController
  def index
    @user_group = UserGroup.find(params[:format])
    slack_users = service.get_slack_users(@user_group)
    create_slack_users(slack_users)
    @slack_users = @user_group.slack_users
  end

  def destroy
    slack_user = SlackUser.find(params[:id])
    slack_user.update_attribute(:active, false)
    flash.now[:success] = "You have removed #{slack_user.name} from lunch roulette."
    redirect_to slack_users_path(slack_user.user_group_id)
  end

  private

    def service
      @service ||= SlackService.new(current_user)
    end

    def create_slack_users(slack_users)
      slackusers = slack_users[:users]
      slackusers.each do |slack_user_id|
        slack_user = service.get_slack_user_info(slack_user_id)
        SlackUser.create_or_find_slack_user(slack_user[:user], @user_group)
      end
    end
end
