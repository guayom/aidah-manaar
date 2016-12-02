class CourseStudent < ActiveRecord::Base
  self.table_name = 'courses_students'

  belongs_to :course
  belongs_to :student

  validates_presence_of :year
  validates_presence_of :semester

  before_create do
    if self.year.blank?
      self.year = Date.today.year
    end

    if self.semester.blank?
      if Date.today.month < 7
        self.semester = 1
      else
        self.semester = 2
      end
    end
  end
end
