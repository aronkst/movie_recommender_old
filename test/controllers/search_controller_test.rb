require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get index without parameter' do
    get search_index_url

    assert_response :success
    assert_select 'title', 'Search - Movie Recommender'
    assert_select 'h1', 'Search'
    assert_select 'h5', 0
  end

  test 'should get index with parameter' do
    get search_index_url(search: 'star wars')

    assert_response :success
    assert_select 'title', 'Search by star wars - Movie Recommender'
    assert_select 'h1', 'Search: star wars'
    assert_select 'h5', CrawlerSearchMovie.new.load('star wars').length
  end
end
