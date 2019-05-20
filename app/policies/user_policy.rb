class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  private

  def user_owner_or_admin?
    record.user == user || user.admin
  end
end
