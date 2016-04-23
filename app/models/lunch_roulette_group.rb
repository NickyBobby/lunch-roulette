class LunchRouletteGroup < ActiveRecord::Base

  def self.get_random_group(group)
    lr_group = []
    group.each do |user|
      lr_group << user.name
    end
    lr_group
  end
end
