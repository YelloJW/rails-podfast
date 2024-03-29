class Episode < ApplicationRecord
  acts_as_votable
  has_many :episode_tags, dependent: :destroy
  has_many :tags, through: :episode_tags
  has_many :playlist_episodes, dependent: :destroy
  has_many :playlists, through: :playlist_episodes
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :summary, presence: true
  validates :length, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_summary,
    against: [:title, :summary],
    using: {
      tsearch: { prefix: true }
    }
end
