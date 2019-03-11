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
end
