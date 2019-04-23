require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    log_in_as(users(:one))
    get category_index_url
    assert_response :success
  end

  test "should redirect if not logged in" do
    get category_index_url
    assert_redirected_to login_url
  end

end
