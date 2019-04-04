require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Example User", password: "foobar", password_digest: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  # test "password_digest should be present" do
  #   @user.password_digest = "     "
  #   assert_not @user.valid?
  # end

  test "username should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  # test  "password length min 6 char" do
  #   @user.password_digest = "abcdf"
  #   assert_not @user.valid?
  # end
  #
  test "password should be present (nonblank)" do
    @user.password_digest = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password_digest = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
