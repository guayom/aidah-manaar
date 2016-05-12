class AddBeginnerToStudent < ActiveRecord::Migration
  def change
    add_column :students, :beginner, :boolean
  end
end
