class User < ActiveRecord::Base
  time_for_a_boolean :vegetarian
  time_for_a_boolean :vegan
  time_for_a_boolean :gluten_free
  time_for_a_boolean :admin

  def self.from_omniauth(auth)
    user_info = auth[:info]
    find_or_create_by(uid: auth[:uid]) do |user|
      user.first_name = user_info[:first_name]
      user.last_name  = user_info[:last_name]
      user.image_url  = user_info[:image_24]
      user.admin_at   = user_info[:is_admin]
      user.username   = user_info[:nickname]
      user.token      = auth[:credentials][:token]
    end
  end
end
