module CoursesHelper
  def available_places(course)
    "#{course.available_places} places available (#{course.quota} total)"
  end
end
