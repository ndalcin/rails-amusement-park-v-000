class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :show, :update]
  def new
    @user = User.new
  end

  def create

    @user = User.new
    if @user.password == @user.password_confirmation
      @user.name = params[:user][:name]
      @user.password_digest = params[:user][:password]
      @user.tickets = params[:user][:tickets]
      @user.height = params[:user][:height]
      @user.happiness = params[:user][:happiness]
      @user.nausea = params[:user][:nausea]
      if params[:user][:admin] == "1"
        @user.admin = true
      end
      if @user.save
        session[:user_id] = @user.id #logging in
        redirect_to user_path(@user), notice: "Thank you for signing up!"
      end
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:id, :name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets)
  end
end
