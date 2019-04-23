class CategoryController < ApplicationController
  before_action 'logged_in_user'

  def index
    get_categories
    get_expenses
  end

  private

  def get_categories
    @categories = Expense.find_by_sql("select DISTINCT category from expenses where user_id = #{current_user.id}")
    get_list
  end

  def get_list
    @list = []
    @categories.each_with_index do |page, i|
      @list.push(page.category)
    end
    @list
  end

  def get_expenses
    @expenses = Expense.find_by_sql("select * from expenses where user_id = #{current_user.id} and category = '#{params['category']}' ")
  end


end
