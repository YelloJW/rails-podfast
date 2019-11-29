class Comment < ApplicationRecord
  belongs_to :episode
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { minimum: 20 }
end
