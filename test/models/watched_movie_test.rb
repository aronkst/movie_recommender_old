require 'test_helper'

class WatchedMovieTest < ActiveSupport::TestCase
  test 'should not save an empty watched movie' do
    watched_movie = WatchedMovie.new
    assert_not watched_movie.save
  end

  test 'should not save a watched movie only with the imdb column' do
    watched_movie = WatchedMovie.new(imdb: 'tt4154756')
    assert_not watched_movie.save
  end

  test 'you should not save a watched movie with only the score column' do
    watched_movie = WatchedMovie.new(score: 10)
    assert_not watched_movie.save
  end

  test 'should not save a movie with a score greater than 10' do
    watched_movie = WatchedMovie.new(imdb: 'tt4154796', score: 11)
    assert_not watched_movie.save
  end

  test 'should not save a movie with a score less than 1' do
    watched_movie = WatchedMovie.new(imdb: 'tt4154664', score: 0)
    assert_not watched_movie.save
  end

  test 'should save an watched movie of the values are correct' do
    watched_movie = WatchedMovie.new(imdb: 'tt3501632', score: 10)
    assert watched_movie.save
  end

  test 'should not save an assisted movie with an already saved imdb' do
    WatchedMovie.create(imdb: 'tt0848228', score: 10)
    watched_movie = WatchedMovie.new(imdb: 'tt0848228', score: 10)
    assert_not watched_movie.save
  end
end
