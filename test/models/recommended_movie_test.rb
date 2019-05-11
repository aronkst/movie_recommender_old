require 'test_helper'

class RecommendedMovieTest < ActiveSupport::TestCase
  test 'should not save an empty recommended movie' do
    recommended_movie = RecommendedMovie.new
    assert_not recommended_movie.save
  end

  test 'should not save a movie recommended only with the imdb column' do
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796')
    assert_not recommended_movie.save
  end

  test 'should not save a movie recommended only with the recommended_imdb column' do
    recommended_movie = RecommendedMovie.new(recommended_imdb: 'tt4154796')
    assert_not recommended_movie.save
  end

  test 'should not save a recommended movie with the imdb and recommended_imdb column with equal values' do
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796', recommended_imdb: 'tt4154796')
    assert_not recommended_movie.save
  end

  test 'should save the recommended movie with all the values filled in' do
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796', recommended_imdb: 'tt4154756')
    assert recommended_movie.save
  end

  test 'should not save a recommended movie if there is already a line with the imdb and recommended_imdb column with the same values' do
    RecommendedMovie.create(imdb: 'tt4154796', recommended_imdb: 'tt4154756')
    recommended_movie = RecommendedMovie.new(imdb: 'tt4154796', recommended_imdb: 'tt4154756')
    assert_not recommended_movie.save
  end
end
