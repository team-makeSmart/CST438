require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get sessions_new_url
    assert_response :success
    assert_template 'sessions/new'
    assert_template 'layouts/_shim'
    assert_template 'layouts/_header'
    assert_template 'layouts/application'
  end

end
