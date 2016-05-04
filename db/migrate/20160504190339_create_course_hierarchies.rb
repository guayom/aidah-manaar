class CreateCourseHierarchies < ActiveRecord::Migration
  def change
    create_table :course_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :course_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "course_anc_desc_idx"

    add_index :course_hierarchies, [:descendant_id],
      name: "course_desc_idx"
  end
end
