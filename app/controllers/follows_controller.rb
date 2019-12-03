class FollowsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to '/users' }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
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
