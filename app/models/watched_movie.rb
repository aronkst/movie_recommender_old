class WatchedMovie < ApplicationRecord
  validates :imdb, :score, presence: true
  validates :imdb, uniqueness: true
  validates :score, inclusion: 1..10
  has_one :movie, primary_key: :imdb, foreign_key: :imdb, class_name: 'Movie'
end
