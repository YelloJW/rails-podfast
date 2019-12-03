class FollowsController < ApplicationController
  def create
    current_user.follow(User.find(params[:id]))
    redirect_to '/users'
  end

  def show
  end

  def index
  end

  def destroy
    current_user.stop_following(User.find(params[:id]))
    redirect_to '/users'
  end
end
