class BlockedMoviesController < ApplicationController
  before_action :title

  def index
    @blocked_movies = BlockedMovie.includes(:movie).all
  end

  def create
    blocked_movie = BlockedMovie.new(imdb: params[:imdb])
    unless blocked_movie.save
      flash[:error] = 'Could not block this movie'
    end
    redirect_to blocked_movies_index_path
  end

  def destroy
    blocked_movie = BlockedMovie.find_by_imdb!(params[:imdb])
    unless blocked_movie.delete
      flash[:error] = 'Unable to remove this movie from your blocked movies'
    end
    redirect_to blocked_movies_index_path
  end

  private

  def title
    @title = 'Blocked Movies'
  end
end
