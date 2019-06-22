require 'test_helper'

class BlockedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get blocked_movies_index_url

    assert_response :success
    assert_select 'title', 'Blocked Movies - Movie Recommender'
    assert_select 'h5', 1
  end

  test 'should get create' do
    post blocked_movies_create_url('tt2674426')

    assert_redirected_to blocked_movies_index_url
    follow_redirect!
    assert_select 'h5', 2
  end

  test 'should get create error' do
    post blocked_movies_create_url('tt1517451')

    assert_redirected_to blocked_movies_index_url
    follow_redirect!
    assert_select 'div#flash_error', 'Could not block this movie'
    assert_select 'h5', 1
  end

  test 'should get destroy' do
    delete blocked_movies_destroy_url('tt1517451')

    assert_redirected_to blocked_movies_index_url
    follow_redirect!
    assert_select 'h5', 0
  end

  test 'should get destroy error' do
    delete blocked_movies_destroy_url('test')
    assert_response :missing
  end
end
