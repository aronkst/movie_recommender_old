class MostPopularMoviesController < ApplicationController
  before_action :title

  def index
    @movies = CrawlerMostPopularMovies.new.load
  end

  private

  def title
    @title = 'Most Popular Movies'
  end
end
