class DashboardController < ApplicationController


  def index

    unless params['from'].nil? || params['to'].nil? || params['from']=="" ||params['to']==""


    @from = params['from']
    @to = params['to']

    @last_expense = Expense.first.created_at.strftime("%Y-%m-%d")

    # records = Expense.select(:amount, :created_at).where("created_at >= ? AND created_at <= ? ","#{@from} 00:00:01","#{@to} 23:59:59")
    @expenses = Expense.where(created_at: (Date.parse(@from) -1.day)...Date.parse(@to)+ 1.day)

    # byebug

    @empty_records = @expenses == []

    end
  end


end

