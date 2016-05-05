class MoveQuotaFromCourseToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :quota, :integer, null: false, default: 0
    remove_column :courses, :quota
  end
end
