class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      binding.pry
    end
  end
end
