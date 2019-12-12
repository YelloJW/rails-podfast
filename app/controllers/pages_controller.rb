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

      search = params[:keyword]
      podcasts = Unirest.get "https://listen-api.listennotes.com/api/v2/search?q=#{search}&sort_by_date=0&type=episode&offset=0&len_min=10&len_max=30&genre_ids=68%2C82&published_before=1390190241000&published_after=0&only_in=title%2Cdescription&language=English&safe_mode=1",
        headers:{
          "X-ListenAPI-Key" => "d30081f4e98d4b378b6e8f96aa275b91",
        }
      @result = podcasts.body["results"]

      genres = Unirest.get "https://listen-api.listennotes.com/api/v2/genres",
        headers:{
          "X-ListenAPI-Key" => "d30081f4e98d4b378b6e8f96aa275b91",
        }

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
