class CreateMovieJob < ApplicationJob
  queue_as :default

  def perform(imdb)
    crawler = CrawlerMovie.new(imdb).load
    movie = Movie.new
    movie.imdb = crawler[:imdb]
    movie.score = crawler[:score]
    movie.title = crawler[:title]
    movie.summary = crawler[:summary]
    movie.year = crawler[:year]
    movie.genres = crawler[:genres]
    movie.save
    movie
  end
end
