module LunchGroupHelper
  def get_names(group)
    lr_group = []
    group.each do |user|
      lr_group << user.name
    end
    lr_group
  end
end
