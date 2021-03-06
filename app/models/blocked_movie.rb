class BlockedMovie < ApplicationRecord
  validates :imdb, presence: true
  validates :imdb, uniqueness: true
  has_one :movie, primary_key: :imdb, foreign_key: :imdb, class_name: 'Movie'
end
