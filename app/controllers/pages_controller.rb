class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
    # Commented out until we work out how to implement Spotify / Podcasts API
    # @artists = RSpotify::Artist.search('Arctic Monkeys')
    # @podcasts = RSpotify::Category.search('podcasts')
  end

  def search
    @default_tags = Tag.all.where(default: true)
    @other_tags = Tag.all.where(default: false)
  end
end
