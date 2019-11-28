class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show]

  def index
    @playlists = Playlist.all
    @playlist = Playlist.new
  end

  def show
  end

  def new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    @playlist.save
    redirect_to playlists_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end
end
