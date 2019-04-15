ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !session[:user_id].nil?
  end


  def redirect_if_not_logged_in(url)
    get url
    if !is_logged_in?
      assert_redirected_to login_url
    else
      assert_response :success
    end
  end

end


class ActionDispatch::IntegrationTest

  def log_in_as(user)
    get login_path
    post login_path, params: {session: {username: user.username, password: 'password'}}
  end

end