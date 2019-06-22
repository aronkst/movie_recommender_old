require 'test_helper'

class WatchedMovieTest < ActiveSupport::TestCase
  test 'should not save an empty watched movie' do
    watched_movie = WatchedMovie.new
    assert_not watched_movie.save
  end

  test 'should save an watched movie of the values are correct' do
    watched_movie = WatchedMovie.new(imdb: 'tt3501632')
    assert watched_movie.save
  end

  test 'should not save an assisted movie with an already saved imdb' do
    WatchedMovie.create(imdb: 'tt0848228')
    watched_movie = WatchedMovie.new(imdb: 'tt0848228')
    assert_not watched_movie.save
  end
end
