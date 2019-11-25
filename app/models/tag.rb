class Tag < ApplicationRecord
  has_many :episode_tags
  validates :tag, presence: true, uniqueness: true
end
