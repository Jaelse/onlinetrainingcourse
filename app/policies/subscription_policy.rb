class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def subscribe?
    true
  end

  def subscriptions?
    if user.user_role === 'student'
      true
    end
  end
end
