require 'test_helper'

class ExpensesJsonTest < ActionDispatch::IntegrationTest

  fixtures :all


  test "update expenses" do
    # first login user
    log_in_as(users(:three))


    john_expense = expenses(:three)
    # update the amount from 15 to 35
    john_expense.amount = 35

    json_data = ActiveSupport::JSON.encode john_expense

    put expense_url(expenses(:three).id) + ".json", as: :json, headers: {'RAW_POST_DATA' => json_data}

    assert_response :success

    john_expense.reload
    assert john_expense.amount = 35


    get expense_url(expenses(:three).id), params: {format: :json}
    assert_equal 35, ActiveSupport::JSON.decode(@response.body)['amount']

  end


end
