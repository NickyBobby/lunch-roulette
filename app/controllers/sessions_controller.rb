class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_url, :notice => "Signed out!"
  end
end
