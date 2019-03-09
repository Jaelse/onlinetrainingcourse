class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :fname
      t.string :lname
      t.string :citizenid
      t.integer :substype
      t.string :insorstid
      t.string :dept

      t.timestamps
    end
  end
end
