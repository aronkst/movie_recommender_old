require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_index_url(search: 'star wars')
    assert_response :success
  end

  test "should get new" do
    get search_new_url('tt0076759')
    assert_response :success
  end

end
