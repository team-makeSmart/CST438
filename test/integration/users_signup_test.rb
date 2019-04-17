require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: {username: "", password: "foo", password_confirmation: "bar"}}
    end
    assert_template 'users/new'
    assert !is_logged_in?
  end

  # test "valid signup information" do
  #   get signup_path
  #   assert_difference 'User.count', 1 do
  #     post users_path, params: {user: {username: "some-user", password: "password", password_confirmation: "password",email:"example@email.com"}}
  #   end
  #   follow_redirect!
  #   assert_template '/'
  #   assert is_logged_in?
  # end

end
