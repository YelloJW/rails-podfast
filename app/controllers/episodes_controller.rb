class EpisodesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_episode, only: [:show]

  def index
    search
  end

  def show
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def search
    if params[:search][:query].present?
      search_params = params[:search][:query]
      @episodes = Episode.search_by_title_and_summary(search_params)
    else
      @episodes = Episode.all
    end
  end
end
