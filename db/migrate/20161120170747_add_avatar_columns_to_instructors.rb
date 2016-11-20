class AddAvatarColumnsToInstructors < ActiveRecord::Migration
  def up
   add_attachment :instructors, :avatar
 end

 def down
   remove_attachment :instructors, :avatar
 end
end
