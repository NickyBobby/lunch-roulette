class Api::V1::LunchRouletteGroupsController < Api::V1::BaseController
  # respond_to :json

  def index
    # respond_with LunchRouletteGroup.generate_lunch_roulette_groups
    render json: LunchRouletteGroup.generate_lunch_roulette_groups
  end
end
