class CreateMovieJob < ApplicationJob
  queue_as :default

  def perform(imdb)
    crawler = CrawlerMovie.new(imdb).load
    movie = Movie.new(crawler)
    movie.save
    movie
  end
end
