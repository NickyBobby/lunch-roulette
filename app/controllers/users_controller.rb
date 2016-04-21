class UsersController < ApplicationController
  def edit
    @user = User.find(params[:username])
  end

  def show
    @user = current_user
  end

  def update
    user = User.find(params[:username])
    user.update(user_params)
    redirect_to user
  end

  private

    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :vegetarian,
                                   :vegan,
                                   :gluten_free,
                                   :favorite_food)
    end
end
