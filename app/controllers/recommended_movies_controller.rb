class RecommendedMoviesController < ApplicationController
  before_action :title

  def index
    @recommended_movies = RecommendedMovie.movies
  end

  private

  def title
    @title = 'Recommended Movies'
  end
end
