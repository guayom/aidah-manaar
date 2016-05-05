class CreateCourseStudents < ActiveRecord::Migration
  def change
    create_table :courses_students do |t|
      t.belongs_to :course, index: true
      t.belongs_to :student, index: true

      t.timestamps null: false
    end
  end
end
