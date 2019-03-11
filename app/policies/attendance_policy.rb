class AttendancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def give_attendance?
    if user.user_role === 'student'
      true
    end
  end
end
