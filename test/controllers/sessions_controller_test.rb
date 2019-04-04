require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should check for already logged in user" do
    get sessions_new_url
    assert_redirected_to root_url if  is_logged_in?
  end

end
