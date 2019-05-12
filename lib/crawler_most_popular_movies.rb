require 'nokogiri'
require 'open-uri'

class CrawlerMostPopularMovies
  def initialize
    @popular_movies = {}
    create
  end

  def load
    @popular_movies
  end

  private

  def create
    html = open('https://www.imdb.com/chart/moviemeter').read
    nokogiri = Nokogiri::HTML(html)
    movies = nokogiri.xpath("//tbody[@class='lister-list']/tr")
    movies.each do |movie|
      score = movie.xpath('.//td[@class="ratingColumn imdbRating"]/strong/text()')
      if score.length > 0
        imdb = movie.xpath('.//td[@class="titleColumn"]/a/@href')[0].text
        imdb = imdb[0..imdb.index('?')]
        imdb = imdb.gsub('/title/', '').delete('/')
        title = movie.xpath('.//td[@class="titleColumn"]/a/text()')[0].text
        year = movie.xpath('.//td[@class="titleColumn"]/span[@class="secondaryInfo"]/text()')[0].text
        image = movie.xpath('.//td[@class="posterColumn"]/a/img/@src')[0].text
        score = score[0].text.to_f
        @popular_movies[imdb] = {
          imdb: imdb,
          title: title,
          year: year,
          score: score,
          image: image
        }
      end
    rescue
    end
    @popular_movies
  end
end
