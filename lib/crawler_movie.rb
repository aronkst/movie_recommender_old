require 'nokogiri'
require 'open-uri'

class CrawlerMovie
  def initialize
    @imdb = nil
    @movie = nil
  end

  def load(imdb)
    @imdb = imdb
    @movie = {}
    create!
    @movie
  end

  private

  def load_site
    html = open("https://www.imdb.com/title/#{@imdb}/").read
    Nokogiri::HTML(html)
  end

  def create!
    nokogiri = load_site
    imdb
    title(nokogiri)
    year(nokogiri)
    summary(nokogiri)
    score(nokogiri)
    genres(nokogiri)
    image(nokogiri)
    recommended_movies(nokogiri)
  end

  def imdb
    @movie[:imdb] = @imdb
  end

  def title(nokogiri)
    title = nokogiri.xpath("//meta[@property='og:title']/@content")[0].text
    title = title.strip
    title = title.gsub(' - IMDb', '')
    @movie[:title] = title.gsub(/\s*\(.+\)$/, '')
  rescue StandardError
    @movie[:title] = ''
  end

  def year(nokogiri)
    year = nokogiri.xpath("//h1/span[@id='titleYear']/a/text()")[0].text
    year = year.strip
    year = year.gsub('(', '')
    year = year.gsub(')', '')
    @movie[:year] = year.to_i
  rescue StandardError
    @movie[:year] = 0
  end

  def summary(nokogiri)
    summary = nokogiri.xpath("//div[@class='summary_text']/text()")[0].text
    @movie[:summary] = summary.strip
  rescue StandardError
    @movie[:summary] = ''
  end

  def score(nokogiri)
    xpath = "//div[@class='ratingValue']/strong/" \
            "span[@itemprop='ratingValue']/text()"
    score = nokogiri.xpath(xpath)[0].text
    score = score.strip
    @movie[:score] = score.to_f
  rescue StandardError
    @movie[:score] = 0.0
  end

  def genres(nokogiri)
    xpath = "//div[@class='see-more inline canwrap'][2]/a/text()"
    genres = nokogiri.xpath(xpath).to_a
    @movie[:genres] = genres.join(', ')
  rescue StandardError
    @movie[:genres] = ''
  end

  def image(nokogiri)
    image = nokogiri.xpath("//div[@class='poster']/a/img/@src")[0].text
    @movie[:image] = image.strip
  rescue StandardError
    @movie[:image] = ''
  end

  def recommended_movies(nokogiri)
    xpath = "//div[@class='rec_item']/@data-tconst"
    recommended_movies = nokogiri.xpath(xpath).to_a
    @movie[:recommended_movies] = recommended_movies.join(', ')
  rescue StandardError
    @movie[:recommended_movies] = ''
  end
end
