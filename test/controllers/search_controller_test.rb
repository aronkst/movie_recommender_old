require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get search_index_url(search: 'star wars')
    assert_response :success
  end
end
