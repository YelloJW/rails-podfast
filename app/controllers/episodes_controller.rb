class EpisodesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_episode, only: [:show]

  def index
    @episodes = keyword_search
    episode_default_tags
    episode_general_tags
  end

  def show
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def keyword_search
    if params[:keyword] != ""
      Episode.search_by_title_and_summary(params[:keyword])
    else
      Episode.all
    end
  end

  def tag_search(episodes, tags)
    matching_episodes = []
    episodes.each do |episode|
      episode.tags.each do |episode_tag|
        matching_episodes << episode if tags.include? episode_tag.id.to_s
      end
    end
    matching_episodes.uniq!
  end

  def episode_default_tags
    if params.key? :default_tags
      @default_tags = params[:default_tags][:tag_ids]
      @episodes = tag_search(@episodes, @default_tags)
    end
  end

  def episode_general_tags
    if params.key? :general_tags
      @general_tags = params[:general_tags][:tag_ids]
      @episodes = tag_search(@episodes, @general_tags)
    end
  end
end
