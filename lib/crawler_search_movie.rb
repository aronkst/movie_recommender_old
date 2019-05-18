require 'nokogiri'
require 'open-uri'

class CrawlerSearchMovie
  def initialize
    @search = nil
    @movies = nil
  end

  def load(search)
    @search = search.gsub(' ', '+')
    @movies = []
    create!
    @movies.sort_by { |h| -h[:year] }
  end

  private

  def create!
    nokogiri = load_site
    movies = nokogiri.xpath('//tr[contains(@class, "findResult")]')
    movies.each do |movie|
      @movies.append(
        imdb: imdb(movie),
        title: title(movie),
        year: year(movie),
        image: image(movie)
      )
    end
  end

  def load_site
    html = open("https://www.imdb.com/find?q=#{@search}&s=tt&ttype=ft").read
    Nokogiri::HTML(html)
  end

  def title(movie)
    title = movie.xpath('.//td[@class="result_text"]/a/text()')[0].text
    title.strip
  rescue StandardError
    ''
  end

  def year(movie)
    year = movie.xpath('.//td[@class="result_text"]/text()')[1].text.strip
    year = year.gsub('(', '')
    year = year.gsub(')', '')
    year.to_i
  rescue StandardError
    0
  end

  def image(movie)
    movie.xpath('.//img/@src')[0].text
  rescue StandardError
    nil
  end

  def imdb(movie)
    imdb = movie.xpath('.//td[@class="result_text"]/a/@href')[0].text
    imdb = imdb[0..16]
    imdb = imdb.gsub('/title/', '')
    imdb.gsub('/', '')
  rescue StandardError
    ''
  end
end
