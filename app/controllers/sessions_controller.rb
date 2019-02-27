require 'pry'

class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) unless !current_user
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_url
  end
end
