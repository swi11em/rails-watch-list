class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list, message: "This movie is already bookmarked in this list." }
end
