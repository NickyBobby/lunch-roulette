class LunchRouletteGroupsController < ApplicationController
  def index
    @slack_users = SlackUser.all
    @lunch_roulette = generate_lunch_roulette_groups(@slack_users)
    binding.pry
  end

  private

    def generate_lunch_roulette_groups(slack_users)
      users = slack_users.order('RANDOM()')
      lr_groups = []
      users.each_slice(4) do |group|
        
        lr_groups << LunchRouletteGroup.get_random_group(group)
      end
      lr_groups
    end
end
