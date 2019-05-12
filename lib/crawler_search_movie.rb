require 'nokogiri'
require 'open-uri'

class CrawlerSearchMovie
  def initialize(search)
    @search = search.gsub(" ", "+")
    @movies = []
    create
  end

  def load
    @movies
  end

  private

  def create
    html = open("https://www.imdb.com/find?q=#{@search}&s=tt&ttype=ft").read
    nokogiri = Nokogiri::HTML(html)
    movies = nokogiri.xpath('//tr[contains(@class, "findResult")]')
    for movie in movies do
      movie_info = {}
      movie_info[:imdb] = get_imdb(movie)
      movie_info[:title] = get_title(movie)
      movie_info[:year] = get_year(movie)
      movie_info[:image] = get_image(movie)
      @movies.push(movie_info)
    end
  end

  def get_title(movie)
    movie.xpath('.//td[@class="result_text"]/a/text()')[0].text.strip
  rescue
    ""
  end

  def get_year(movie)
    year = movie.xpath('.//td[@class="result_text"]/text()')[1].text.strip
    year = year.gsub("(", "").gsub(")", "")
    year.to_i
  rescue
    0
  end

  def get_image(movie)
    movie.xpath(".//img/@src")[0].text
  rescue
    ""
  end

  def get_imdb(movie)
    imdb = movie.xpath('.//td[@class="result_text"]/a/@href')[0].text
    imdb[0..16].gsub("/title/", "").gsub("/", "")
  rescue
    ""
  end
end
