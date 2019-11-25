class Tag < ApplicationRecord
  has_many :episodes, through: :episode_tags
  has_many :episode_tags
  validates :tag, presence: true, uniqueness: true
end
