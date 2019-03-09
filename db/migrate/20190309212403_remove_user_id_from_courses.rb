class RemoveUserIdFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :user_id
  end
end
