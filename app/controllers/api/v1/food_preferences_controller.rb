class Api::V1::FoodPreferencesController < Api::V1::BaseController

  def update
    slack_user = SlackUser.find_by(slack_id: params[:user_id])
    render json: slack_user.get_response(params)
  end
end
