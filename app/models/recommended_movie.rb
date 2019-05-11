class RecommendedMovie < ApplicationRecord
  validates :imdb, :recommended_imdb, presence: true
  has_one :movie, primary_key: :imdb, foreign_key: :imdb, class_name: 'Movie'
  has_one :recommended_movie, primary_key: :recommended_imdb, foreign_key: :imdb, class_name: 'Movie'
end
