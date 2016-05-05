class LessonStudent < ActiveRecord::Base
  self.table_name = 'lessons_students'

  belongs_to :lesson
  belongs_to :student
end
