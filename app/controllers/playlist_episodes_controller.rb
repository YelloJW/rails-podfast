class PlaylistEpisodesController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    playlist_episode = PlaylistEpisode.find(params[:id])
    playlist = playlist_episode.playlist_id
    playlist_episode.destroy
    redirect_to playlist_path(playlist)
  end
end
