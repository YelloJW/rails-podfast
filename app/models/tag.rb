class Tag < ApplicationRecord
  belongs to :episode_tags
  validates :tag, presence: true, uniqueness: true
end
