class WatchedMovie < ApplicationRecord
  validates :imdb, :score, presence: true
  validates :imdb, uniqueness: true
  validates :score, inclusion: 1..10
  has_one :movie, primary_key: :imdb, foreign_key: :imdb, class_name: 'Movie'

  after_create do
    CreateMovieJob.perform_now(imdb)
    CreateRecommendedMovieJob.perform_later(imdb)
  end
end
