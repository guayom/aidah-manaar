class AddTimesToLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :length
    add_column :lessons, :start_time, :datetime, null: false
    add_column :lessons, :end_time, :datetime, null: false
  end
end
