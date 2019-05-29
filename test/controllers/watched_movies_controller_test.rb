require 'test_helper'

class WatchedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get watched_movies_index_url
    assert_response :success
    # Title?
    # Movies?
  end

  test 'should get new' do
    get watched_movies_new_url('tt6155172')
    assert_response :success
    # Title?
    # New IMDB correct?
  end

  test 'should get create' do
    pass
    # Load?
    # Create?
    # Redirect?
  end

  test 'should get create error' do
    pass
    # Load?
    # Error?
    # Render?
  end

  test 'should get edit' do
    get watched_movies_edit_url('tt6966692')
    assert_response :success
    # Title?
    # New IMDB correct?
  end

  test 'should get update' do
    pass
    # Load?
    # Update?
    # Redirect?
  end

  test 'should get update error' do
    pass
    # Load?
    # Error?
    # Render?
  end

  test 'should get destroy' do
    pass
    # Destroy?
    # Redirect?
  end

  test 'should get destroy error' do
    pass
    # Error?
    # Redirect?
  end
end
