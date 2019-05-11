class RecommendedMovie < ApplicationRecord
  validates :imdb, :recommended_imdb, presence: true
  validate :equal_values, :duplicate_line
  has_one :movie, primary_key: :imdb, foreign_key: :imdb, class_name: 'Movie'
  has_one :recommended_movie, primary_key: :recommended_imdb, foreign_key: :imdb, class_name: 'Movie'

  private

  def equal_values
    if imdb == recommended_imdb
      errors.add(:recommended_imdb, 'the imdb and recommended_imdb columns are the same')
    end
  end

  def duplicate_line
    if RecommendedMovie.where(imdb: imdb, recommended_imdb: recommended_imdb).count > 0
      errors.add(:imdb, 'a line with these values already exists')
    end
  end
end
