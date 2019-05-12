require 'test_helper'

class BlockedMovieTest < ActiveSupport::TestCase
  test 'should not save an empty locked movie' do
    blocked_movie = BlockedMovie.new
    assert_not blocked_movie.save
  end

  test 'should save a locked movie with an imdb' do
    blocked_movie = BlockedMovie.new(imdb: 'tt4154756')
    assert blocked_movie.save
  end

  test 'should not save a locked movie with the same imdb' do
    BlockedMovie.create(imdb: 'tt4154796')
    blocked_movie = BlockedMovie.new(imdb: 'tt4154796')
    assert_not blocked_movie.save
  end
end
