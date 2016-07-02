class CourseStudent < ActiveRecord::Base
  self.table_name = 'courses_students'

  belongs_to :course
  belongs_to :student

  def as_json(options = nil)
    attrs = {
      only: [
        'id',
        'course_id',
        'student_id',
        'created_at',
        'updated_at'
      ]
    }

    super(attrs.merge(options || {}))
  end
end
