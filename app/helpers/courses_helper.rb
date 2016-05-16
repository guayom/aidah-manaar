module CoursesHelper
  def courses_tree_for(courses = @courses)
    res = courses.map do |course|
      render(course) + nested_part(course.children)
    end

    res.join.html_safe
  end

  private

  def nested_part(courses)
    return if courses.size.zero?

    content_tag(:div, class: 'nested') do
      courses_tree_for(courses)
    end
  end
end
