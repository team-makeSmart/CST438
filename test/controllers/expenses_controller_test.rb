require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @expense = expenses(:one)
    log_in_as(@expense.user)
  end

  def redirect_if_not_logged_in(url)
    get url
    if !is_logged_in?
      assert_redirected_to login_url
    else
      assert_response :success
    end
  end

  test "should redirect to login if not logged in" do
    redirect_if_not_logged_in(expenses_url)
    redirect_if_not_logged_in(new_expense_url)
    redirect_if_not_logged_in(edit_expense_url(@expense))
    redirect_if_not_logged_in(expense_url(@expense))
  end


  test "should create expense and redirect to all expenses" do
      assert_difference('Expense.count') do
        post expenses_url, params: {expense: {amount: @expense.amount, category: @expense.category, description: @expense.description, user_id: @expense.user_id}}
      end
      assert_redirected_to expenses_url
  end


  test "should redirect destroy when not logged in" do
    assert_no_difference 'Expense.count' do
      delete expense_url(@expense)
    end
    assert_redirected_to login_url
  end

end
