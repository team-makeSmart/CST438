require 'test_helper'

class ExpensesByDateTest < ActionDispatch::IntegrationTest
  fixtures :all

  setup do
    log_in_as(users(:three))
    @expense_first = expenses(:three)
    @expense_second = expenses(:four)
  end

  test "should retrieve amount and date created at" do
    records = Expense.select(:amount, :created_at)
                  .where("created_at >= ? AND created_at <= ? ",
                         "#{(@expense_first.created_at + 7.hours).strftime('%Y-%m-%d %H:%M:%S')}",
                         "#{(@expense_second.created_at + 7.hours).strftime('%Y-%m-%d %H:%M:%S')}")

    assert records[0].amount = 2.5
    assert records[1].amount = 1.5
    assert records[1].created_at == '2019-04-05 17:16:12'
    assert records[0].created_at == '2019-04-08 17:16:12'

  end
end
