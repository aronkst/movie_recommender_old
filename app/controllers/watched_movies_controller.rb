class WatchedMoviesController < ApplicationController
  before_action :set_title_index, only: :index
  before_action :set_title_edit_update, only: [:edit, :update]
  before_action :load_movie, only: [:edit, :update]

  def index
    @watched_movies = WatchedMovie.includes(:movie).all
  end

  def edit
  end

  def update
    if @watched_movie.update(watched_movie_params)
      redirect_to watched_movies_index_path
    else
      render 'edit'
    end
  end

  def delete
    watched_movie = WatchedMovie.find_by_imdb(params[:imdb])
    unless watched_movie.delete
      flash[:error] = 'Unable to remove this movie from your watched movies'
    end
    redirect_to watched_movies_index_path
  end

  private

  def set_title_index
    @title = 'Watched Movies'
  end

  def set_title_edit_update
    @title = "Edit #{@watched_movie.movie.title}"
  end

  def load_movie
    @watched_movie = WatchedMovie.includes(:movie).find_by_imdb(params[:imdb])
  end

  def watched_movie_params
    params.require(:watched_movie).permit(:imdb, :score)
  end
end
