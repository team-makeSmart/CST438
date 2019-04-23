require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest


  test "should get index" do
    log_in_as(users(:three))
    get dashboard_url
    assert_template 'dashboard/index'
    assert_response :success
  end

  test "should redirect if not logged in" do
    get dashboard_url
    assert_redirected_to login_url
  end

end
