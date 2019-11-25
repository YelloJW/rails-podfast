class EpisodeTag < ApplicationRecord
  belongs_to :episode
  belongs_to :tag
end
