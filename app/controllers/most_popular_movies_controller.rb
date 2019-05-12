class MostPopularMoviesController < ApplicationController
  before_action :set_title_index, only: :index
  before_action :set_title_new_create, except: :index

  def index
    @most_popular_movies = CrawlerMostPopularMovies.new.load
  end

  def new
    @watched_movie = WatchedMovie.new(imdb: params[:imdb])
  end

  def create
    @watched_movie = WatchedMovie.new(watched_movie_params)
    if @wathed_movie.save
      redirect_to watched_movies_index_path
    else
      render 'new'
    end
  end

  private

  def set_title_index
    @title = 'Most Popular Movies'
  end

  def set_title_new_create
    @title = "Add #{params[:title]}"
  end

  def watched_movie_params
    params.require(:watched_movie).permit(:imdb, :score)
  end
end
