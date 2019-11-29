class PlaylistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_playlist, only: [:show]

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
    @playlists = Playlist.all
  end

  def update
    @episode = Episode.find(params[:playlist][:episode].to_i)
    @playlist_episode = PlaylistEpisode.new(playlist_id: Playlist.where(name: params[:playlist][:name]).first.id, episode: @episode)
    @playlist = @playlist_episode.playlist
    @episode = @playlist_episode.episode
    if !@playlist.episodes.include? @episode
      @playlist_episode.save
      flash[:notice] = "Episode added to your #{@playlist.name} bookmarks"
    else
      flash[:notice] = 'Already bookmarked!'
    end
    redirect_to episode_path(@episode)
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
