class DancePlan < ActiveRecord::Base
  rails_admin do
    object_label_method do
      :label
    end
  end

  def label
    if 'Amateur' == name
      "#{name} (#{lessons_per_week_text} per week)"
    else
      name
    end
  end

  def lessons_per_week_text
    if lessons_per_week.present?
      "#{lessons_per_week} #{'lesson'.pluralize(lessons_per_week)}"
    else
      'unlimited lessons'
    end
  end
end
