class SwitchAncestryToClosureTree < ActiveRecord::Migration
  def change
    remove_column :courses, :ancestry
    add_column :courses, :parent_id, :integer
  end
end
