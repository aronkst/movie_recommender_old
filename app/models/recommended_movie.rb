class RecommendedMovie < ApplicationRecord
  validates :imdb, :recommended_imdb, presence: true
  validate :equal_values, :duplicate_line
  has_one :movie, primary_key: :imdb, foreign_key: :imdb, class_name: 'Movie'
  has_one :recommended_movie, primary_key: :recommended_imdb, foreign_key: :imdb, class_name: 'Movie'

  def self.movies
    movies = Movie.all.to_a
    recommended_movies = RecommendedMovie.all.to_a
    watched_movies = WatchedMovie.all.to_a

    result = {}

    recommended_movies.group_by(&:recommended_imdb).each do |grouped, values|
      movie = movies.detect { |m| m.imdb == grouped }.as_json
      result[grouped] = movie
      result[grouped]['movies'] = []
      score = 0.0
      values.each do |value|
        movie = movies.detect { |m| m.imdb == value.imdb }.as_json
        watched_movie = watched_movies.detect { |m| m.imdb == value.imdb }.as_json
        movie['my_score'] = watched_movie['score']
        result[grouped]['movies'].push(movie)
        score += movie['score'] * movie['my_score']
      end
      result[grouped]['my_score'] = score * result[grouped]['score']
      result[grouped]['my_score'] = result[grouped]['my_score'].to_i
    end
    result.values.sort_by { |a| -a['my_score'] }
  end

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
