class AddGroupToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :group, foreign_key: true
  end
end
