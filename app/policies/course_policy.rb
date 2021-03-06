class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user_role = user.user_role
    if @user_role === 'admin'
      true
    end 
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  def courses_offered?
    if user.user_role === 'instructor'
      true
    end
  end

  def course_index?
    true
  end

  def subscribe?
    if user.user_role === 'student'
      true
    end
  end

  def takeattendance?
    if user.user_role === 'instructor'
      true
    end
  end

  def give_attendance?
    if user.user_role === 'student'
      true
    end
  end
end
