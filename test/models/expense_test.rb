require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @expense = expenses(:one)
    @expense = Expense.new(amount: @expense.amount, category: @expense.category, description: @expense.description, user_id: @expense.user_id)
  end

  test "should be valid" do
    assert @expense.valid?
  end

  test "user id should be present" do
    @expense.user_id = nil
    assert_not @expense.valid?
  end

  test "description should be present" do
    @expense.description = "   "
    assert_not @expense.valid?
  end

  test "description should be at most 40 characters" do
    @expense.description = "a" * 41
    assert_not @expense.valid?
  end

  test "category should be present" do
    @expense.category = "   "
    assert_not @expense.valid?
  end

  test "category should be at most 40 characters" do
    @expense.category = "a" * 41
    assert_not @expense.valid?
  end

  test "order should be most recent first" do
    assert_equal expenses(:most_recent), Expense.first
  end

end
