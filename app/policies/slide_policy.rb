class SlidePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    return true
  end
  def new?
    return true
  end
  def show?
    is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  def dashboard?
    return true
  end

  private
  def is_owner?
    user == record.user
  end
end
