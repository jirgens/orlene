class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path, :notice => "Logged In!"
    else
      flash.now.alert = "Wrong email or password. Please Try again"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged Out!"
  end
end
