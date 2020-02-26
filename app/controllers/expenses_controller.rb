# frozen_string_literal: true

class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :set_new_expense, only: %i[index new]

  def index
    @q = Expense.ransack(params[:q])
    @expenses = @q.result.includes(:type)
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def edit; end

  def create
    @expense = Expense.new(expense_params)
    authorize(@expense)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
    authorize(@expense)
  end

  def set_new_expense
    @expense = Expense.new
    authorize(@expense)
  end

  def expense_params
    params.require(:expense).permit(:type_id, :name, :price, :note, :datetime)
  end
end
