require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should not allow sign up if already logged in" do
    get new_user_url
    assert_redirected_to root_url if is_logged_in?
  end

end
