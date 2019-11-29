class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit]

  def index
    @playlists = Playlist.all
    @playlist = Playlist.new
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save && params[:playlist][:episode]
      @playlist_episode = PlaylistEpisode.new(playlist: @playlist, episode: Episode.find(params[:playlist][:episode]))
      redirect_to episode_path(@playlist_episode.episode) if @playlist_episode.save
    else
      redirect_to playlists_path
    end
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
