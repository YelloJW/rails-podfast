class UsersController < ApplicationController
  def index
    @users = user_search(params[:username])
  end

  def show
  end

  def user_search(username)
    if username
      User.search_by_username(username)
    end
  end
end
