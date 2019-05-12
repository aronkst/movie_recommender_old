class CreateRecommendedMovieJob < ApplicationJob
  queue_as :default

  def perform(imdb)
    crawler = CrawlerMovie.new(imdb).load
    movies = crawler[:recommended_movies].split(',')
    movies.each do |movie|
      RecommendedMovie.create(imdb: imdb, recommended_imdb: movie)
      CreateMovieJob.perform_later(movie)
    end
  end
end
