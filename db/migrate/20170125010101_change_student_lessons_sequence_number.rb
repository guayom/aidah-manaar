class ChangeStudentLessonsSequenceNumber < ActiveRecord::Migration
  def change
    execute <<-SQL
ALTER SEQUENCE lessons_students_id_seq RESTART WITH 500;
    SQL
  end
end
