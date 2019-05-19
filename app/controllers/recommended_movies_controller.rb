class RecommendedMoviesController < ApplicationController
  before_action :title_index, only: :index

  def index
    @recommended_movies = RecommendedMovie.movies
  end

  def block
    watched_movie = BlockedMovie.new(imdb: params[:imdb])
    unless watched_movie.save
      flash[:error] = 'Unable to block this movie from your recommended movies'
    end
    redirect_to recommended_movies_index_path
  end

  private

  def title_index
    @title = 'Recommended Movies'
  end
end
