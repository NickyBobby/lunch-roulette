class UsersController < ApplicationController
  def new

  end

  def show
    @user = SlackUser.new(current_user)
  end
end
