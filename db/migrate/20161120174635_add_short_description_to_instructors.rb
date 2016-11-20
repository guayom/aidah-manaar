class AddShortDescriptionToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :short_description, :string
  end
end
