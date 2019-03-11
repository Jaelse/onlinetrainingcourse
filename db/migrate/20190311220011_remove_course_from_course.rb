class RemoveCourseFromCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :course_id
  end
end
