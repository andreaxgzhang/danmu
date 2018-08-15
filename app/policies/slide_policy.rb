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

  def dashboard?
    is_owner?
  end

  private
  def is_owner?
    user == record.user
  end
end
