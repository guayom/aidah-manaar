class AddDefaultToCoursesDescriptions < ActiveRecord::Migration
  def up
    change_column_default :courses, :full_description, ''
    change_column_default :courses, :public_description, ''

    Course.all.each do |c|
      c.full_description ||= ''
      c.public_description ||= ''

      c.save!
    end
  end

  def down
  end
end
