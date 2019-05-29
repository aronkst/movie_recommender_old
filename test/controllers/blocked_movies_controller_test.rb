require 'test_helper'

class BlockedMoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get blocked_movies_index_url
    assert_response :success
  end

  test 'should get destroy' do
    pass
    # Destroy?
    # Redirect?
  end

  test 'should get destroy error' do
    pass
    # Error?
    # Redirect?
  end
end
