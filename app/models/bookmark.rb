class Bookmark < ApplicationRecord
  belongs_to :movie_id
  belongs_to :list_id
  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "This movie is already bookmarked in this list." }
end
