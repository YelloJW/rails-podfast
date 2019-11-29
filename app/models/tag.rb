class Tag < ApplicationRecord
  has_many :episodes, through: :episode_tags
  has_many :episode_tags, dependent: :destroy
  validates :tag, presence: true, uniqueness: true
end
