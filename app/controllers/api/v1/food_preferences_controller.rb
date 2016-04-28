class Api::V1::FoodPreferencesController < Api::V1::BaseController
  include FoodPreferenceHelper
  
  def update
    @slack_user = SlackUser.find_by(slack_id: params[:user_id])
    if params[:text].include?('#add')
      food = @slack_user.add_food(params)
      render json: {text: "#{food} was added to your food preferences ;)"}
    elsif params[:text].include?('#delete')
      food = @slack_user.delete_food(params)
      render json: {text: "#{food} was deleted from your food preferences :("}
    elsif params[:text].include?('#list')
      render json: {text: "Your food preferences are #{@slack_user.foods}"}
    else
      render json: {text: help}
    end
  end
end
