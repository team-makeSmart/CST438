class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :show, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    if (current_user)
      @expenses = Expense.all
      @first_time = @expenses.where(user_id: current_user.id) == []
    else
      redirect_to login_url
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create

    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html {redirect_to '/expenses'}
        flash[:success] = "Expense successfully created "
        format.json {render :show, status: :created, location: @expense}
      else
        format.html {render :new}
        format.json {render json: @expense.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|

      if @expense.update(expense_params)
        format.html {redirect_to @expense}
        flash[:success] = "Expense successfully updated "
        format.json {render :show, status: :ok, location: @expense}
      else
        format.html {render :edit}
        format.json {render json: @expense.errors, status: :unprocessable_entity}
      end

    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      flash[:success] = "Expense successfully deleted "
      format.html {redirect_to expenses_url}
      format.json {head :no_content}
    end
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:user_id, :amount, :category, :description)
  end
end
