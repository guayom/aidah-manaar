class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@aidah-manaar.com'
  layout 'mailer'

  def confirm_course_enrollment(student, course)
    mail(to: student.email, subject: 'Confirmation of course enrollment')
  end
end
