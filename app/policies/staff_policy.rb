# frozen_string_literal: true

class StaffPolicy < ApplicationPolicy
  def index?
    user.present? && user.admin?
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    false
  end

  def edit?
    false
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
