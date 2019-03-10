class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def filtered_groups?
    true
  end
  
  def create?
    if Course.where( subscriber_id: Subscriber.where( user_id: user.id).first.id).exists? 
      true
    end
  end
end