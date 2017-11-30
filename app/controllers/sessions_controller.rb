class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Signed in!"
    else
      flash.now.alert = "Email or password is invalid"
      redirect_to signin_path
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
