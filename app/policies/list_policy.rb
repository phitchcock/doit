class ListPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where('visibility > 0 OR user_id = ?', user.id)
    end
  end

  def index?
    true
  end

  def show?
    record.viewable? || record.open? || record.user == user
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    record.open? || record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user
  end
end
