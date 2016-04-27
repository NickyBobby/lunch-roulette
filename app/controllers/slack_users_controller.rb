class SlackUsersController < ApplicationController

  def index
    @slack_users = SlackUser.all
  end

  def destroy
    slack_user = SlackUser.find(params[:id])
    slack_user.update_attribute(:active, false)
    flash[:success] = "You have removed #{slack_user.name} from lunch roulette."
    redirect_to user_group_path(slack_user.user_group_id)
  end

  def update
    slack_user = SlackUser.find(params[:id])
    slack_user.update_attribute(:active, true)
    flash[:success] = "You have added #{slack_user.name} from lunch roulette."
    redirect_to user_group_path(slack_user.user_group_id)
  end
end
