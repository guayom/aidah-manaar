class Lesson < ActiveRecord::Base
  belongs_to :branch
  belongs_to :course
  belongs_to :instructor

  has_many :lessons_students, class_name: 'LessonStudent', dependent: :destroy
  has_many :students, through: :lessons_students

  validates_presence_of :start_time, :end_time
end
