require 'test_helper'

class ExpensesByCategoryTest < ActionDispatch::IntegrationTest
  fixtures :all

  setup do
    log_in_as(users(:three))
  end

  test 'should retrieve expense according to category' do
    records = Expense.find_by_sql("select DISTINCT category from expenses where user_id = #{users(:three).id}")
    assert records[0].category = 'Gas'
    assert records[1].category = 'Groceries'
  end
end
