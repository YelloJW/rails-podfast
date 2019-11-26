class EpisodesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_episode, only: [:show]

  def index
    @episodes = keyword_search
    raise
    @default_tags = params[:default_tags][:tag_ids]
    @general_tags = params[:general_tags][:tag_ids]
    @episodes = default_tag_search(@episodes, @default_tags)
    raise
  end

  def show
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def keyword_search
    if params[:keyword]
      Episode.search_by_title_and_summary(params[:keyword])
    else
      Episode.all
    end
  end

  def default_tag_search(episodes, default_tags)
    raise
    matching_episodes = []
    episodes.each do |episode|
      episode.tags.each do |episode_tag|
        matching_episodes << episode if default_tags.include? episode_tag.id
      end
    end
  end

  def general_tag_search
  end
end
