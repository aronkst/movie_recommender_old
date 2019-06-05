require 'test_helper'

class MostPopularMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get most_popular_movies_index_url
    assert_response :success

    assert_select 'title', 'Most Popular Movies - Movie Recommender'

    crawler_movies = CrawlerMostPopularMovies.new.load
    assert_select 'h5', crawler_movies.length
  end
end
