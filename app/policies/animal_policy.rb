class AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    
    def show?
      true
    end

    def create?
      true
    end

    def update?
      record.user == user

    end

    def destroy?
      record.user == user
    end

    def resolve
      scope.all
    end
  end
end
