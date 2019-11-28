class CommentsController < ApplicationController
  before_action :set_comment, only: [ :edit, :update, :destroy]
  def index
    raise
  end

  def new
    raise
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @episode = params[:episode_id]
    @comment.episode_id = @episode
    @comment.user_id = @user.id
    if @comment.save
      redirect_to episode_path(@episode)
    else
      flash.now[:notice] = "Invalid comment... Please try again."
      redirect_to episode_path(@episode)
    end
  end

  def edit
  end

  def update
    raise
  end

  def destroy
    @episode = Episode.find(@comment.episode_id)
    @comment.destroy
    redirect_to episode_path(@episode)
  end

  def comment_params
    params.require(:comment).permit(:title, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
