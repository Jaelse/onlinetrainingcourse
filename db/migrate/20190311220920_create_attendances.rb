class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :subscription, foreign_key: true
      t.date :class_date
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
