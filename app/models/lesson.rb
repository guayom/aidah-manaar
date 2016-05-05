class Lesson < ActiveRecord::Base
  belongs_to :branch
  belongs_to :course
  belongs_to :instructor

  enum day_of_week: { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6,
                      sunday: 7 }

  has_many :lessons_students, class_name: 'LessonStudent', dependent: :destroy
  has_many :students, through: :lessons_students

  validates_presence_of :course, :branch, :start_time, :end_time

  def time_interval
    "#{start_time.strftime('%H:%M')}–#{end_time.strftime('%H:%M')}"
  end

  def available_places
    quota - students.count
  end

  def has_available_places?
    available_places > 0
  end
end
