require 'open-uri'

class CreateMovieJob < ApplicationJob
  queue_as :default

  def perform(imdb)
    crawler = CrawlerMovie.new.load(imdb)
    movie = movie(imdb, crawler)
    if movie.save
      movie.image.attach(io: open(crawler[:image]), filename: "#{imdb}.jpg")
    end
    movie
  end

  private

  def movie(imdb, crawler)
    movie = Movie.new
    movie.imdb = imdb
    movie.score = crawler[:score]
    movie.title = crawler[:title]
    movie.summary = crawler[:summary]
    movie.year = crawler[:year]
    movie.genres = crawler[:genres]
    movie
  end
end
