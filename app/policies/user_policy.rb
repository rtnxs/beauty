# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    destroy?
  end

  def show?
    destroy?
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    destroy?
  end

  def edit?
    destroy?
  end

  def destroy?
    user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
