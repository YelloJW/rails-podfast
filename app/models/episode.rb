class Episode < ApplicationRecord
  has_many :episode_tags
  validates :title, presence: true, uniqueness: true
  validates :summary, presence: true
  validates :length, presence: true
end
