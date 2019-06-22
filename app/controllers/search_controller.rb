class SearchController < ApplicationController
  before_action :title

  def index
    @movies = []
    return unless params[:search]

    @movies = CrawlerSearchMovie.new.load(params[:search])
  end

  private

  def title
    @title = 'Search'
    return unless params[:search]

    @title = "Search by #{params[:search]}"
  end
end
