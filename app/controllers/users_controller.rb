class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome!"
      redirect_to "/"
    else
      flash[:notice] = "There was a problem creating your account please try again!"
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :bio, :preference, :image, :cycle_length, :password, :password_confirmation, :admin)
  end

end
