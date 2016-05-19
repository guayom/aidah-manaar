class RenameDescriptionToPublicDescriptionInCourses < ActiveRecord::Migration
  def change
    rename_column :courses, :description, :public_description
  end
end
