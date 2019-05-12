class BlockedMoviesController < ApplicationController
  before_action :set_title

  def index
    @blocked_movies = BlockedMovie.includes(:movie).all
  end

  def delete
    blocked_movie = BlockedMovie.find_by_imdb(params[:imdb])
    unless blocked_movie.delete
      flash[:error] = 'Unable to remove this movie from your blocked movies'
    end
    redirect_to blocked_movies_index_path
  end

  private

  def set_title
    @title = 'Blocked Movies'
  end
end
