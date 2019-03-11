class LogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def attendance?
    if user.user_role === 'instructor'
      true
    end
  end

  def finished_class?
    if user.user_role === 'instructor'
      true
    end
  end
end
