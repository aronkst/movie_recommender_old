class RecommendedMoviesController < ApplicationController
  def index
    @recommended_movies = RecommendedMovie.movies
  end

  def new
  end
end
