class Movie < ApplicationRecord
  validates :imdb, :score, :title, :summary, :year, :genres, presence: true
  validates :imdb, uniqueness: true
  validates :score, inclusion: 0..10
  validates :year, numericality: { greater_than: 0 }
  has_one_attached :image
end
