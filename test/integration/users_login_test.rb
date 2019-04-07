require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:John)
  end


  test "login with invalid information" do
    get login_path

    assert_template 'sessions/new'
    post login_path, params: {session: {username: "", password_digest: ""}}

    assert_template 'sessions/new'
    assert_not flash.empty?

  end


  test "login with valid information" do
    get login_path
    post login_path, params: {session: {username: @user.username,
                                        password_digest: 'password'}}


    assert_template 'sessions/new'
    assert_template 'layouts/_shim'
    assert_template 'layouts/_header'
    assert_template 'layouts/application'

    assert_select "a[href=?]", login_path, count: 1
    assert_select "a[href=?]", root_path, count: 2

  end

  test "login then logout" do
    get login_path
    post login_path, params: {session: {username: @user.username,
                                        password_digest: 'password'}}

    get root_url
    assert_response :success
    assert_template 'static_pages/home'

    delete logout_path

    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", root_url

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url

    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0

  end

end
