class PlaylistsController < ApplicationController
  before_action :set_playlast, only: [:show]

  def index
    @playlists = Playlist.all
  end

  def show
  end

  def new
  end

  def create
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
    params.require(:playlist).permit(:name)
  end
end
