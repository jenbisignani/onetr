class SessionsController < ApplicationController

  skip_before_filter :require_login

  def create
    user = User.find_by_username(params[:username].downcase)
    session[:user_id] = user.id
    redirect_to user
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    redirect_to :users, :notice => "Logged out!"
  end
end
