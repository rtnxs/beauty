# frozen_string_literal: true

class ServicePolicy < ApplicationPolicy
  def index?
    destroy?
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
    user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
