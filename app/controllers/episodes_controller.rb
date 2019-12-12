class EpisodesController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :set_episode, only: [:show]

  # def index
  #   @episodes = keyword_search
  #   @episodes_ranked = @episodes.map {|episode| { episode: episode, default_tags: 0, general_tags: 0 } }
  #   @default_tags = params.dig(:default_tags, :tag_ids)
  #   @general_tags = params.dig(:general_tags, :tag_ids)
  #   rank_by_default_tags(@episodes_ranked)
  #   rank_by_general_tags(@episodes_ranked)
  #   @episodes_ranked.sort_by! do |episode_hash|
  #     [-episode_hash[:default_tags], -episode_hash[:general_tags]]
  #   end
  # end

  def index
    search_params = set_search_params
    @podcasts = listen_notes_search(search_params)
    @genres_hash = listen_notes_directory
  end

  def show
    @playlist = Playlist.new(params[:user_id])
    @playlists = Playlist.all
    @episode = listen_notes_episode
  end

  def upvote
    @episode = Episode.find(params[:id])
    @episode.upvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @episode = Episode.find(params[:id])
    @episode.votes_for.find_by(voter_id: current_user.id).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_search_params
    {
    search: params[:keyword],
    min_len: params[:min_len] || 0,
    max_len: params[:max_len] || 300, #minutes
    genre_ids: params[:genre_ids] || "68, 82", #comma seperated list
    published_before: DateTime.now.strftime('%Q'), #current DateTime now in miliseconds
    published_after: 0, # start of time in miliseconds
    search_in: "title, description, author" # can also add audio
    }
  end

  def listen_notes_search(search_params)
    # API call based on query params
    podcasts = Unirest.get "https://listen-api.listennotes.com/api/v2/search?q=#{search_params[:search]}&sort_by_date=0&type=episode&offset=0&len_min=#{search_params[:min_len]}&len_max=#{search_params[:max_len]}&genre_ids=#{search_params[:genre_ids]}&published_before=#{search_params[:published_before]}&published_after=#{search_params[:published_after]}&only_in=#{search_params[:search_in]}&language=English&safe_mode=1",
      headers:{
        "X-ListenAPI-Key" => "d30081f4e98d4b378b6e8f96aa275b91",
      }
    # parse unirest::HTTP
    podcasts.body["results"]
  end

  def listen_notes_directory
    # API call to listennotes directory to return genre ids and names
    genres = Unirest.get "https://listen-api.listennotes.com/api/v2/genres",
      headers:{
        "X-ListenAPI-Key" => "d30081f4e98d4b378b6e8f96aa275b91",
      }
    # generate hash of genres {id: name} from API response
    genres_hash = {}
    genres.body["genres"].each do |genre_hash|
      genres_hash[genre_hash["id"]] = genre_hash["name"]
    end
    genres_hash
  end

  def listen_notes_episode
    episode = Unirest.get "https://listen-api.listennotes.com/api/v2/episodes/02f0123246c944e289ee2bb90804e41b",
      headers:{
        "X-ListenAPI-Key" => "d30081f4e98d4b378b6e8f96aa275b91",
    }
    episode.body
  end

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def keyword_search
    if params[:keyword].present?
      session[:keyword] = params[:keyword]
      Episode.search_by_title_and_summary(params[:keyword])
    else
      session[:keyword] = nil
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
      session[:default_tags] = params[:default_tags]
      @default_tags = params[:default_tags][:tag_ids]
      @episodes_ranked = set_default_tag_rank(episodes_ranked, @default_tags)
    else
      session[:default_tags] = nil
    end
  end

  def rank_by_general_tags(episodes_ranked)
    if params.key? :general_tags
      session[:general_tags] = params[:general_tags]
      @general_tags = params[:general_tags][:tag_ids]
      @episodes_ranked = set_general_tag_rank(episodes_ranked, @general_tags)
    else
      session[:general_tags] = nil
    end
  end
end
