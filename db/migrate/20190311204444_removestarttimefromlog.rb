class Removestarttimefromlog < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :class_start
    remove_column :logs, :class_end

    add_column :logs, :class_started, :boolean
    add_column :logs, :class_ended, :boolean
  end
end
