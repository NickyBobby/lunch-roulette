class Api::V1::LunchRouletteGroupsController < Api::V1::BaseController
  respond_to :json, :html

  def index
    @lunch_roulette = LunchRouletteGroup.generate_lunch_roulette_groups
    render json: @lunch_roulette
  end
end
