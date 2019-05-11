require 'test_helper'

class BlockedMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blocked_movies_index_url
    assert_response :success
  end

end
