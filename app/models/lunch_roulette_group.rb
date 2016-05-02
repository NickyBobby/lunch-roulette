class LunchRouletteGroup

  def self.generate_lunch_roulette_groups
    staff = SlackUser.is_admin.to_a
    students = SlackUser.is_student.to_a
    groups_size = ((staff.count + students.count)/4.0).ceil
    groups = []
    groups_size.times do
      if staff.count > 0
        groups << [staff.shift, students.shift, students.shift, students.shift]
      elsif students.count == 2
        groups << [students.shift, students.shift, groups[-1].shift]
      elsif students.count == 1
        groups << [students.shift, groups[-1].shift, groups[-2].shift]
      else
        groups << students.shift(4)
      end
    end
    name_groups = LunchRouletteGroup.get_name_groups(groups)
    {text: name_groups.join}
  end

  def self.get_name_groups(groups)
    groups.map do |group|
      "* " + LunchRouletteGroup.get_names(group).join(", ") + "\n"
    end
  end

  def self.get_names(group)
    group.map do |user|
      user.name
    end
  end
end
