class SessionsController < ApplicationController
  def create 
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) #if user exists and logged in correctly
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end

  def new

  end
end
