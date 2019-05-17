class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    user?
  end

  def destroy?
    user?
  end

  private

  def user?
    record.user == user
  end
end
