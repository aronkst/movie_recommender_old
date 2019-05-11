require 'test_helper'

class WatchedMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get watched_movies_index_url
    assert_response :success
  end

  test "should get edit" do
    get watched_movies_edit_url
    assert_response :success
  end

end
