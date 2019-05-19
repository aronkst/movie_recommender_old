class MostPopularMoviesController < ApplicationController
  before_action :title_index, only: :index

  def index
    @movies = CrawlerMostPopularMovies.new.load
  end

  private

  def title_index
    @title = 'Most Popular Movies'
  end
end
