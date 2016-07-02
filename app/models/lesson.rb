class Lesson < ActiveRecord::Base
  belongs_to :branch
  belongs_to :course
  belongs_to :instructor

  enum day_of_week: { lunes: 1, martes: 2, miércoles: 3, jueves: 4, viernes: 5, sábado: 6,
                      domingo: 7 }

  has_many :lessons_students, class_name: 'LessonStudent', dependent: :destroy
  has_many :students, through: :lessons_students

  validates_presence_of :course, :branch, :start_time, :end_time

  def time_interval
    "#{start_time.in_time_zone.strftime('%R')}–#{end_time.in_time_zone.strftime('%R')}"
  end

  def available_places
    quota - students.count
  end

  def has_available_places?
    available_places > 0
  end

  def as_json(options = nil)
    attrs = {
      only: [
        'id',
        'branch_id',
        'course_id',
        'instructor_id',
        'created_at',
        'updated_at',
        'start_time',
        'end_time',
        'day_of_week',
        'quota'
      ]
    }

    super(attrs.merge(options || {}))
  end
end
