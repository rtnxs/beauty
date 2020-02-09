class StaffController < ApplicationController
  def index
    @visits = Visit.all
    @expenses = Expense.all
  end
end
