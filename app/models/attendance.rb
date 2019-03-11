class Attendance < ApplicationRecord
  belongs_to :subscription
  belongs_to :course
end
