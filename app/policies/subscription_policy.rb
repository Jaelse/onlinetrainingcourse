class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
 
  def subscribe?
    true
  end

  def unsubscribe?
    if user.user_role === 'student'
      true
    end
  end

  def subscriptions?
    if user.user_role === 'student'
      true
    end
  end

  def unsubscriptions?
    if user.user_role === 'student'
      true
    end
  end

  def courses_taken?
    if user.user_role === 'student'
      true
    end
  end

  def subscribed_students?
    true
  end

  def show_members?
    true
  end

  def add_members?
    if user.user_role === 'instructor'
      true
    end
  end

  def added_members?
    if user.user_role === 'instructor'
      true
    end
  end

  def removed_members?
    if user.user_role === 'instructor'
      true
    end
  end

  def grades?
    if user.user_role === 'instructor'
      true
    end
  end

  def add_grade?
    if user.user_role === 'instructor'
      true
    end
  end
  def group_filtered?
    if user.user_role === 'instructor'
      true
    end
  end
end
