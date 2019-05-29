require 'test_helper'

class RecommendedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get recommended_movies_index_url
    assert_response :success
    # Title?
    # Movies?
  end

  test 'should get block' do
    pass
    # Block?
    # Redirect?
  end

  test 'should get block error' do
    pass
    # Error?
    # Redirect?
  end
end
