class WatchedMoviesController < ApplicationController
  before_action :movie_edit_update_destroy, only: %i[edit update destroy]
  before_action :title_index, only: :index
  before_action :title_new_create, only: %i[new create]
  before_action :title_edit_update, only: %i[edit update]

  def index
    @watched_movies = WatchedMovie.includes(:movie).all.order(score: :desc)
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

  def edit; end

  def update
    if @watched_movie.update(watched_movie_params)
      redirect_to watched_movies_index_path
    else
      render 'edit'
    end
  end

  def destroy
    unless @watched_movie.delete
      flash[:error] = 'Unable to remove this movie from your watched movies'
    end
    redirect_to watched_movies_index_path
  end

  private

  def title_index
    @title = 'Watched Movies'
  end

  def title_new_create
    @title = "Add #{params[:title]}"
  end

  def title_edit_update
    @title = "Edit #{@watched_movie.movie.title}"
  end

  def movie_edit_update_destroy
    @watched_movie = WatchedMovie.includes(:movie).find_by_imdb!(params[:imdb])
  end

  def watched_movie_params
    params.require(:watched_movie).permit(:imdb, :score)
  end
end
