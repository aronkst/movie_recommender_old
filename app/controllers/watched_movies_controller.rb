class WatchedMoviesController < ApplicationController
  before_action :title_index, only: :index

  def index
    @watched_movies = WatchedMovie.includes(:movie).all
  end

  def create
    watched_movie = WatchedMovie.new(imdb: params[:imdb])
    unless watched_movie.save
      flash[:error] = 'Could not add this movie to watched movies'
    end
    redirect_to watched_movies_index_path
  end

  def destroy
    watched_movie = WatchedMovie.find_by_imdb!(params[:imdb])
    unless watched_movie.delete
      flash[:error] = 'Unable to remove this movie from your watched movies'
    end
    redirect_to watched_movies_index_path
  end

  private

  def title_index
    @title = 'Watched Movies'
  end
end
