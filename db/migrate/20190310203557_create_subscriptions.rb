class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :subscriber, foreign_key: true
      t.references :course, foreign_key: true
      t.string :grade

      t.timestamps
    end
  end
end
