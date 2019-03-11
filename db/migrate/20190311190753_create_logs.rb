class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :course, foreign_key: true
      t.date :class_date
      t.time :class_start
      t.time :class_end

      t.timestamps
    end
  end
end
