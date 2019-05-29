require 'test_helper'

class MostPopularMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get most_popular_movies_index_url
    assert_response :success
    # Title?
    # Movies?
  end
end
