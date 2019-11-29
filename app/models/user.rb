class User < ApplicationRecord
  acts_as_voter
  acts_as_follower
  acts_as_followable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :playlists, dependent: :destroy
  has_many :comments, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_username,
    against: [:username],
    using: {
      tsearch: { prefix: true }
    }
end
