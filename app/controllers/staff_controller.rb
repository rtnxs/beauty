# frozen_string_literal: true

class StaffController < ApplicationController
  def index
    authorize(current_user)

    @visits = Visit.where(
      'datetime BETWEEN ? AND ?',
      Time.current.beginning_of_month,
      Time.current.end_of_month
    ).order('datetime DESC')
    @expenses = Expense.where(
      'datetime BETWEEN ? AND ?',
      Time.current.beginning_of_month,
      Time.current.end_of_month
    ).order('datetime DESC')
  end
end
