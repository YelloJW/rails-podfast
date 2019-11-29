class Playlist < ApplicationRecord
  belongs_to :user
  acts_as_followable
  has_many :playlist_episodes, dependent: :destroy
  has_many :episodes, through: :playlist_episodes
  validates :name, presence: true
end
