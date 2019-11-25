class Episode < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :summary, presence: true
  validates :length, presence: true
end
