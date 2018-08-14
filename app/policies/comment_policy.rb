class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.joins(:slide).where('slides.user_id = ? ', user.id)
    end
  end

  # def index?
  #   true
  # end
  def create?
    return true
  end
  def new
    return true
  end
  def show?
    return true
  end
  def update?
    return true
  end
  def destroy?
    return true
  end

  private
  def is_owner?
    user == record.user
  end
end
