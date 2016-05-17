class AddFullDescriptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :full_description, :text
  end
end
