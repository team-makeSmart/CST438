require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Example User", password: "foobar", password_digest: "foobar",email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end



  test "password_digest should be present" do
    @user.password_digest = "     "
    assert_not @user.valid?
  end



  test "password length min 6 char" do
    @user.password_digest = "abcdf"
    assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password_digest = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password_digest = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated expenses should be destroyed" do
    @user.save
    @user.expenses.create!(amount: 30, category: "fruits", description: "desc")
    assert_difference 'Expense.count', -1 do
      @user.destroy
    end
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    @user2 = users(:one)
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user2.email = invalid_address
      assert_not  @user2.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end


  # in case adding username to User

  # test "username should be present" do
  #   @user.username = ""
  #   assert_not @user.valid?
  # end

  # test "username should be unique" do
  #   duplicate_user = @user.dup
  #   @user.save
  #   assert_not duplicate_user.valid?
  # end


end
