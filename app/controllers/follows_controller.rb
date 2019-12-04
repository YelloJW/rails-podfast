class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    @follow = Follow.find_by(followable: @user, follower: current_user)
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def show
  end

  def index
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js
    end
  end
end
