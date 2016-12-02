class AddSemesterToCoursesStudents < ActiveRecord::Migration
  def up
    add_column :courses_students, :year, :integer
    add_column :courses_students, :semester, :integer

    CourseStudent.all.each do |cs|
      cs.year = 2016
      cs.semester = 2
      cs.save!
    end
  end

  def down
    remove_column :courses_students, :year
    remove_column :courses_students, :semester
  end
end
