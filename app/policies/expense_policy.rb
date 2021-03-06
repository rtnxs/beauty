# frozen_string_literal: true

class ExpensePolicy < ApplicationPolicy
  def index?
    user.present? && user.admin?
  end

  def show?
    destroy?
  end

  def create?
    destroy?
  end

  def new?
    destroy?
  end

  def update?
    destroy?
  end

  def edit?
    destroy?
  end

  def destroy?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
