require 'test_helper'

class RecommendedMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recommended_movies_index_url
    assert_response :success
  end

  test "should get new" do
    get recommended_movies_new_url
    assert_response :success
  end

end
