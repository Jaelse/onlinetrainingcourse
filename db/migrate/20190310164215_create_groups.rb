class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :course, foreign_key: true
      t.text :project

      t.timestamps
    end
  end
end
