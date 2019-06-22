require 'test_helper'

class WatchedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get watched_movies_index_url

    assert_response :success
    assert_select 'title', 'Watched Movies - Movie Recommender'
    assert_select 'h5', 1
  end

  test 'should get create' do
    post watched_movies_create_url('tt6155172')

    assert_redirected_to watched_movies_index_url
    follow_redirect!
    assert_select 'h5', 2
  end

  test 'should get create error' do
    post watched_movies_create_url('tt6966692')

    assert_redirected_to watched_movies_index_url
    follow_redirect!
    assert_select 'div#flash_error',
                  'Could not add this movie to watched movies'
    assert_select 'h5', 1
  end

  test 'should get destroy' do
    delete watched_movies_destroy_url('tt6966692')

    assert_redirected_to watched_movies_index_url
    follow_redirect!
    assert_select 'h5', 0
  end

  test 'should get destroy error' do
    delete watched_movies_destroy_url('test')
    assert_response :missing
  end
end
