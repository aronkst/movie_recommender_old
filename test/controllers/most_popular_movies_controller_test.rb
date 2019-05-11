require 'test_helper'

class MostPopularMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get most_popular_movies_index_url
    assert_response :success
  end

  test "should get new" do
    get most_popular_movies_new_url
    assert_response :success
  end

end
