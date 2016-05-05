class AddDayOfWeekToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :day_of_week, :integer, null: false, default: 1
    change_column :lessons, :start_time, :time
    change_column :lessons, :end_time, :time
  end
end
