class AddSubcribersToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :subscribers, foreign_key: true
  end
end
