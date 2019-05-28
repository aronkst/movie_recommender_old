class SearchController < ApplicationController
  before_action :title_index

  def index
    @movies = []
    return unless params[:search]

    @movies = CrawlerSearchMovie.new.load(params[:search])
  end

  private

  def title_index
    @title = "Search By #{params[:search]}"
  end
end
