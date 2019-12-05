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

  def random_podcast
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
