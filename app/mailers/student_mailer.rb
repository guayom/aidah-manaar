class StudentMailer < ApplicationMailer
  def confirm_registration(student)
    @student = student
    mail(to: student.email, subject: t('devise.registrations.thank_you.title'))
  end

  def confirm_course_enrollment(student, course)
    @student = student
    @course = course
    mail(to: student.email,
         subject: t('helpers.student.you_are_enrolled_to_course', course_name: course.name))
  end
end
