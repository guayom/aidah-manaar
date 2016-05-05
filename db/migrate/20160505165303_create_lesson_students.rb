class CreateLessonStudents < ActiveRecord::Migration
  def change
    create_table :lessons_students do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :student, index: true

      t.timestamps null: false
    end
  end
end
