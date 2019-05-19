class SearchController < ApplicationController
  before_action :check_params_search, only: :index
  before_action :title_index, only: :index

  def index
    @movies = CrawlerSearchMovie.new.load(params[:search])
  end

  private

  def check_params_search
    return unless params[:search].nil? || params[:search].strip.empty?

    flash[:error] = 'Could not search because the search word was not found'
    redirect_to root_path
  end

  def title_index
    @title = "Search By #{params[:search]}"
  end
end
