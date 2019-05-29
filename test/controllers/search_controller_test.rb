require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index without parameter' do
    get search_index_url
    assert_response :success
    # Title?
    # Movies?
  end

  test 'should get index with parameter' do
    get search_index_url(search: 'star wars')
    assert_response :success
    # Param?
    # Title?
    # Movies?
  end
end
