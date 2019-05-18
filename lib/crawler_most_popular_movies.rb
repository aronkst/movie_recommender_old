require 'nokogiri'
require 'open-uri'

class CrawlerMostPopularMovies
  def initialize
    @movies = nil
  end

  def load
    @movies = []
    create!
    @movies.sort_by { |h| -h[:score] }
  end

  private

  def create!
    nokogiri = load_site
    movies = nokogiri.xpath("//tbody[@class='lister-list']/tr")
    movies.each do |movie|
      next unless score?(movie)

      @movies.push(
        imdb: imdb(movie),
        title: title(movie),
        year: year(movie),
        score: score(movie),
        image: image(movie)
      )
    end
  end

  def load_site
    html = open('https://www.imdb.com/chart/moviemeter').read
    Nokogiri::HTML(html)
  end

  def score?(movie)
    score = movie.xpath('.//td[@class="ratingColumn imdbRating"]/strong/text()')
    score.any?
  rescue StandardError
    false
  end

  def score(movie)
    score = movie.xpath('.//td[@class="ratingColumn imdbRating"]/' \
                        'strong/text()')[0].text
    score.to_f
  rescue StandardError
    0.0
  end

  def imdb(movie)
    imdb = movie.xpath('.//td[@class="titleColumn"]/a/@href')[0].text
    imdb = imdb[0..imdb.index('?')]
    imdb = imdb.gsub('/title/', '')
    imdb.delete('/')
  rescue StandardError
    ''
  end

  def title(movie)
    movie.xpath('.//td[@class="titleColumn"]/a/text()')[0].text
  rescue StandardError
    ''
  end

  def year(movie)
    movie.xpath('.//td[@class="titleColumn"]/' \
                'span[@class="secondaryInfo"]/text()')[0].text
  rescue StandardError
    ''
  end

  def image(movie)
    movie.xpath('.//td[@class="posterColumn"]/a/img/@src')[0].text
  rescue StandardError
    nil
  end
end
