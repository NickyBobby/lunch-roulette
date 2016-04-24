class LunchRouletteGroup < ActiveRecord::Base

  def self.get_names(group)
    lr_group = []
    group.each do |user|
      lr_group << user.name
    end
    lr_group
  end
end
