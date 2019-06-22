require 'test_helper'

class RecommendedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get recommended_movies_index_url

    assert_response :success
    assert_select 'title', 'Recommended Movies - Movie Recommender'
    assert_select 'h5', 1
  end
end
