class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  def get_restaurant_names(restaurants)
    restaurant_names = []
    restaurants.each do |restaurant|
      restaurant_names << "* " + restaurant.name
    end
    restaurants = restaurant_names.shuffle.shift(10)
    {text: restaurants.join("\n")}
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
