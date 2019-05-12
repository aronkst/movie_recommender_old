require 'open-uri'

class CreateMovieJob < ApplicationJob
  queue_as :default

  def perform(imdb)
    crawler = CrawlerMovie.new(imdb).load
    movie = Movie.new
    movie.imdb = imdb
    movie.score = crawler[:score]
    movie.title = crawler[:title]
    movie.summary = crawler[:summary]
    movie.year = crawler[:year]
    movie.genres = crawler[:genres]
    if movie.save
      movie.image.attach(io: open(crawler[:image]), filename: "#{imdb}.jpg")
    end
    movie
  end
end
