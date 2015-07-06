class SessionsController < ApplicationController

  def new
  end

  def create
    #try to authenticate the user - if they authenticate successfully, an instance of the User model is returned
    @user = User.authenticate(params[:username], params[:password])
    #if an instance is returned and @user is not nil...
    if @user
      flash[:notice] = "You're in!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "Uh oh, problems."
      redirect_to "/log-in"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're out of here."
    redirect_to "/"
  end

end
