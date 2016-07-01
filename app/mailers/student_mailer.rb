class StudentMailer < ApplicationMailer
  def confirm_registration(student, password, params = {})
    @student = student
    @password = password
    @params = params
    mail(to: student.email, subject: t('devise.registrations.thank_you.title'))
  end

  def confirm_schedule_enrollment(student)
    @student = student
    @lessons = student.lessons
    mail(to: student.email,
         subject: t('helpers.student.you_are_enrolled'))
  end
end
