class CourseStudent < ActiveRecord::Base
  CURRENT_SEMESTER = { year: 2017, semester: 1 }
  ACTUAL_SEMESTERS = [
    { year: 2017, semester: 1 },
    { year: 2016, semester: 2 }
  ]

  self.table_name = 'courses_students'



  belongs_to :course
  belongs_to :student

  validates_presence_of :year
  validates_presence_of :semester

  after_initialize unless: :persisted? do
    self.year ||= CURRENT_SEMESTER[:year]
    self.semester ||= CURRENT_SEMESTER[:semester]
  end
end
