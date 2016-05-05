class StudentMailer < ApplicationMailer
  def confirm_registration(student)
    mail(to: student.email, subject: 'Confirmation of registration')
  end

  def confirm_course_enrollment(student, course)
    mail(to: student.email, subject: 'Confirmation of course enrollment')
  end
end
