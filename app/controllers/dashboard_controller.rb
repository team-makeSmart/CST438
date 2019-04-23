class DashboardController < ApplicationController
  before_action 'logged_in_user'

  def index
    unless params['from'].nil? || params['to'].nil? || params['from'] == "" || params['to'] == ""
      get_records
    end
  end

  private

  def get_records
    @valid = true

    date_input

    if @valid
      @from = params['from']
      @to = params['to']
      @last_expense = Expense.first.created_at.strftime("%Y-%m-%d")
      # records = Expense.select(:amount, :created_at).where("created_at >= ? AND created_at <= ? ","#{@from} 00:00:01","#{@to} 23:59:59")
      @expenses = Expense.where("created_at >= ? AND created_at <= ?", (Date.parse(@from) - 1.day), Date.parse(@to) + 36.hour)

      @empty_records = @expenses == []

    end
  end

  def date_input
    begin
      Date.parse(params['from'])
      Date.parse(params['to'])
    rescue ArgumentError
      @valid = false
    end
  end




end

