class AddUserToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscribers, :user, foreign_key: true
  end
end
