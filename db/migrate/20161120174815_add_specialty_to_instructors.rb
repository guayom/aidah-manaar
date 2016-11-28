class AddSpecialtyToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :specialty, :string
  end
end
