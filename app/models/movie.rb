class Movie < ApplicationRecord
  validates :imdb, :score, :title, :summary, :year, :genres, presence: true
  validates :imdb, uniqueness: true
end
