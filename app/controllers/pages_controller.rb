require 'unirest'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :random_podcast]

  def home
    # Commented out until we work out how to implement Spotify / Podcasts API
    # @artists = RSpotify::Artist.search('Arctic Monkeys')
    # @podcasts = RSpotify::Category.search('podcasts')
  end

  def search
    @default_tags = Tag.all.where(default: true)
    @other_tags = Tag.all.where(default: false)
  end

  def listen_search
    if params[:keyword].nil?
    else
      # set query parameters
      search = params[:keyword]
      min_len = params[:min_len] || 0
      max_len = params[:max_len] || 300 #minutes
      genre_ids = params[:genre_ids] || "68, 82" #comma seperated list
      published_before = DateTime.now.strftime('%Q') #current DateTime now in miliseconds
      published_after = 0 # start of time in miliseconds
      search_in = "title, description, author" # can also add audio
      # API call based on query params
      podcasts = Unirest.get "https://listen-api.listennotes.com/api/v2/search?q=#{search}&sort_by_date=0&type=episode&offset=0&len_min=#{min_len}&len_max=#{max_len}&genre_ids=#{genre_ids}&published_before=#{published_before}&published_after=#{published_after}&only_in=#{search_in}&language=English&safe_mode=1",
        headers:{
          "X-ListenAPI-Key" => "d30081f4e98d4b378b6e8f96aa275b91",
        }
      # parse unirest::HTTP
      @result = podcasts.body["results"]
      # API call to listennotes directory to return genre ids and names
      genres = Unirest.get "https://listen-api.listennotes.com/api/v2/genres",
        headers:{
          "X-ListenAPI-Key" => "d30081f4e98d4b378b6e8f96aa275b91",
        }
      # generate hash of genres {id: name} from API response
      @genres_hash = {}
      genres.body["genres"].each do |genre_hash|
        @genres_hash[genre_hash["id"]] = genre_hash["name"]
      end
    end
  end

  def listen_search_details
    raise
  end

  def random_podcast
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
