class PlaylistEpisode < ApplicationRecord
  belongs_to :episode
  belongs_to :playlist
end
