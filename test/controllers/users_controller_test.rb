require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { 'username'=>'username', 'password'=>'foobar', 'password_confirmation'=>'foobar', 'email'=>'example@mail.com' } }
    end
    assert_template 'users/signup_firebase'
  end

  test 'should get api username' do
    get "#{@user.email}.json"
    assert_response :success
    assert_template 'static_pages/home'
  end

end
