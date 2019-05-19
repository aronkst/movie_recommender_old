require 'test_helper'

class WatchedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get watched_movies_index_url
    assert_response :success
  end

  test 'should get new' do
    get watched_movies_new_url('tt6155172')
    assert_response :success
  end

  test 'should get edit' do
    get watched_movies_edit_url('tt6966692')
    assert_response :success
  end
end
