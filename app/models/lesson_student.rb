class LessonStudent < ActiveRecord::Base
  self.table_name = 'lessons_students'

  belongs_to :lesson
  belongs_to :student

  def as_json(options = nil)
    attrs = {
      only: [
        'id',
        'lesson_id',
        'student_id',
        'created_at',
        'updated_at'
      ]
    }

    super(attrs.merge(options || {}))
  end
end
