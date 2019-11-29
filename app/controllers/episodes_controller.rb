class EpisodesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_episode, only: [:show]

  def index
    @episodes = keyword_search
    @episodes_ranked = @episodes.map {|episode| { episode: episode, default_tags: 0, general_tags: 0 } }
    @default_tags = params.dig(:default_tags, :tag_ids)
    @general_tags = params.dig(:general_tags, :tag_ids)
    rank_by_default_tags(@episodes_ranked)
    rank_by_general_tags(@episodes_ranked)
    @episodes_ranked.sort_by! do |episode_hash|
      [-episode_hash[:default_tags], -episode_hash[:general_tags]]
    end
  end

  def show
    @playlist = Playlist.new(params[:user_id])
  end

  def upvote
    @episode = Episode.find(params[:id])
    @episode.upvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @episode = Episode.find(params[:id])
    @episode.upvote_from current_user
    redirect_back(fallback_location: root_path)
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

  def set_default_tag_rank(episodes_ranked, tags)
    episodes_ranked.each do |episode_hash|
      episode_hash[:episode].tags.each do |episode_tag|
        episode_hash[:default_tags] += 1 if tags.include? episode_tag.id.to_s
      end
    end
    episodes_ranked
    @episodes_ranked = @episodes_ranked.select { |episode_hash| episode_hash[:default_tags].positive? }
  end

  def set_general_tag_rank(episodes_ranked, tags)
    episodes_ranked.each do |episode_hash|
      episode_hash[:episode].tags.each do |episode_tag|
        episode_hash[:general_tags] += 1 if tags.include? episode_tag.id.to_s
      end
    end
    episodes_ranked
    @episodes_ranked = @episodes_ranked.select { |episode_hash| episode_hash[:default_tags].positive? }
  end

  def rank_by_default_tags(episodes_ranked)
    if params.key? :default_tags
      @default_tags = params[:default_tags][:tag_ids]
      @episodes_ranked = set_default_tag_rank(episodes_ranked, @default_tags)
    end
  end

  def rank_by_general_tags(episodes_ranked)
    if params.key? :general_tags
      @general_tags = params[:general_tags][:tag_ids]
      @episodes_ranked = set_general_tag_rank(episodes_ranked, @general_tags)
    end
  end

end
