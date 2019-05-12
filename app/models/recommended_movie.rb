class RecommendedMovie < ApplicationRecord
  validates :imdb, :recommended_imdb, presence: true
  validate :equal_values, :duplicate_line
  has_one :movie, primary_key: :imdb, foreign_key: :imdb, class_name: 'Movie'
  has_one :recommended_movie, primary_key: :recommended_imdb, foreign_key: :imdb, class_name: 'Movie'

  def self.movies
    watched_movies = WatchedMovie.all
    movies = Movie.all
    recommended_movies = RecommendedMovie.all

    not_show = BlockedMovie.select(:imdb).all.map { |m| m.imdb }
    not_show += watched_movies.map { |m| m.imdb }
    not_show.uniq!

    result = {}

    recommended_movies.group_by(&:recommended_imdb).each do |grouped, values|
      movie = movies.detect { |m| m.imdb == grouped }
      next if movie == nil or not_show.include?(grouped)
      result[grouped] = {}
      result[grouped]['movie'] = movie
      result[grouped]['recommended_by'] = []
      score = 0.0
      values.each do |value|
        movie = movies.detect { |m| m.imdb == value.imdb }
        result[grouped]['recommended_by'].push(movie)
        watched_movie = watched_movies.detect { |m| m.imdb == value.imdb }
        score += movie.score * watched_movie.score
      end
      result[grouped]['score'] = score * movie.score
      result[grouped]['score'] = result[grouped]['score'].to_i
    end
    result.values.sort_by { |a| -a['score'] }
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
