class Api::V1::LunchRouletteGroupsController < Api::V1::BaseController

  def index
    render json: LunchRouletteGroup.generate_lunch_roulette_groups
  end
end
