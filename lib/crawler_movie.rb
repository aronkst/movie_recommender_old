require 'nokogiri'
require 'open-uri'

class CrawlerMovie
  def initialize(imdb)
    @imdb = imdb
    @movie = {}
    create
  end

  def load
    @movie
  end

  private

  def create
    html = open("https://www.imdb.com/title/#{@imdb}/").read
    nokogiri = Nokogiri::HTML(html)
    @movie[:imdb] = @imdb
    get_title(nokogiri)
    get_year(nokogiri)
    get_summary(nokogiri)
    get_score(nokogiri)
    get_genres(nokogiri)
    get_image(nokogiri)
    get_recommended_movies(nokogiri)
    @movie
  end

  def get_title(nokogiri)
    title = nokogiri.xpath("//meta[@property='og:title']/@content")
    title = title[0].text.strip
    @movie[:title] = title.gsub(" - IMDb", "").gsub(/\s*\(.+\)$/, "")
  rescue
    @movie[:title] = ""
  end

  def get_year(nokogiri)
    year = nokogiri.xpath("//h1/span[@id='titleYear']/a/text()")
    year = year[0].text.strip
    year = year.gsub("(", "").gsub(")", "")
    @movie[:year] = year.to_i
  rescue
    @movie[:year] = 0
  end

  def get_summary(nokogiri)
    summary = nokogiri.xpath("//div[@class='summary_text']/text()")
    @movie[:summary] = summary[0].text.strip
  rescue
    @movie[:summary] = ""
  end

  def get_score(nokogiri)
    score = nokogiri.xpath("//div[@class='ratingValue']/strong/span[@itemprop='ratingValue']/text()")
    score = score[0].text.strip
    @movie[:score] = score.to_f
  rescue
    @movie[:score] = 0.0
  end

  def get_genres(nokogiri)
    all_genres = ""
    genres = nokogiri.xpath("//div[@class='see-more inline canwrap'][2]/a/text()")
    for genre in genres do
      all_genres += genre.text.strip + ","
    end
    @movie[:genres] = all_genres[0...-1]
  rescue
    @movie[:genres] = ""
  end

  def get_image(nokogiri)
    image = nokogiri.xpath("//div[@class='poster']/a/img/@src")
    @movie[:image] = image[0].text.strip
  rescue
    @movie[:image] = ""
  end

  def get_recommended_movies(nokogiri)
    all_recommended_movies = ""
    recommended_movies = nokogiri.xpath("//div[@class='rec_item']/@data-tconst")
    for recommended_movie in recommended_movies do
      all_recommended_movies += recommended_movie.text.strip + ","
    end
    @movie[:recommended_movies] = all_recommended_movies[0..-1]
  rescue
    @movie[:recommended_movies] = ""
  end
end
