require 'test_helper'

class WatchedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get watched_movies_index_url
    assert_response :success
    # Title?
    # Movies?
  end

  test 'should get create' do
    post watched_movies_create_url('tt6155172')
    assert_redirected_to watched_movies_index_url
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
