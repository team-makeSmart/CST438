class DashboardController < ApplicationController
  before_action 'logged_in_user'

  def index
    unless params['from'].nil? || params['to'].nil? || params['from'] == "" || params['to'] == ""
      get_records
    end
  end

  private

  def get_records
    @from = params['from']
    @to = params['to']
    @last_expense = Expense.first.created_at.strftime("%Y-%m-%d")
    @expenses = Expense.find_by_sql("select * from expenses where user_id = #{current_user.id} and created_at >= #{(Date.parse(@from) - 1.day)} and created_at <= '#{(Date.parse(@to) + 36.hour)}' ")
    @empty_records = @expenses == []
  end

end

