class SubscriberPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope
    def resolve
      scope.all
    end
  end

  def index?
    if user.user_role === 'admin'
      true
    end
  end 

  def show?
    @Subscriber_id = Subscriber.where(user_id: user.id).first
    if record.id === @Subscriber_id.id
      true
    elsif user.user_role === 'admin'
      true
    elsif user.user_role === 'instructor'
      true
    end
  end

  def home?
    true
  end

  def create?
    !Subscriber.where(user_id: user.id).exists?
  end

  def update?
    if user.user_role === 'instructor'
      true
    end
  end

  def new?
    create?
  end

  def students_list?
    if user.user_role === 'instructor' 
      true
    elsif user.user_role === 'instructor' 
      true
    end
  end



  def student?
    if user.user_role === 'student'
      true
    end
  end

  def instructor?
    if user.user_role === 'instructor'
      true
    end
  end

  def students_list_filtered?
    if user.user_role === 'instructor'
      true
    end
  end
end
