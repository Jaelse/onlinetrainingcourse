class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum user_role: [:other, :student, :instructor, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.user_role ||= :other
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
