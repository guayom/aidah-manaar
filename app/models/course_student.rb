class CourseStudent < ActiveRecord::Base
  self.table_name = 'courses_students'

  belongs_to :course
  belongs_to :student
end
