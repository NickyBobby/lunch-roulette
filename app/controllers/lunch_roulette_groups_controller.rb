class LunchRouletteGroupsController < ApplicationController
  respond_to :json, :html

  def index
    @lunch_roulette = generate_lunch_roulette_groups
    # binding.pry
    render json: @lunch_roulette
  end

  private

    def generate_lunch_roulette_groups
      staff = SlackUser.is_admin.to_a
      students = SlackUser.is_student.to_a
      total_count = staff.count + students.count
      groups_size = (total_count/4.0).ceil
      groups = []
      groups_size.times do
        if staff.count > 0
          groups << "* " + LunchRouletteGroup.get_names([staff.shift, students.shift, students.shift, students.shift]).join(", ") + "\n"
        else
          groups << "* " + LunchRouletteGroup.get_names(students.shift(4)).join(", ") + "\n"
        end
      end
      {text: groups.join}
    end

end
