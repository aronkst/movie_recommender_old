class RecommendedMoviesController < ApplicationController
  before_action :set_title_index, only: :index
  before_action :set_title_new_create, only: %i[new create]

  def index
    @recommended_movies = RecommendedMovie.movies
  end

  def new
    @watched_movie = WatchedMovie.new(imdb: params[:imdb])
  end

  def create
    @watched_movie = WatchedMovie.new(watched_movie_params)
    if @watched_movie.save
      redirect_to watched_movies_index_path
    else
      render 'new'
    end
  end

  def blocked
    watched_movie = BlockedMovie.new(imdb: params[:imdb])
    unless watched_movie.save
      flash[:error] = 'Unable to block this movie from your recommended movies'
    end
    redirect_to recommended_movies_index_path
  end

  private

  def set_title_index
    @title = 'Recommended Movies'
  end

  def set_title_new_create
    @title = "Add #{params[:title]}"
  end

  def watched_movie_params
    params.require(:watched_movie).permit(:imdb, :score)
  end
end
