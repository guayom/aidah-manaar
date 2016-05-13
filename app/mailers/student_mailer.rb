class StudentMailer < ApplicationMailer
  def confirm_registration(student)
    @student = student
    mail(to: student.email, subject: t('devise.registrations.thank_you.title'))
  end

  def confirm_schedule_enrollment(student, lessons)
    @student = student
    @lessons = lessons
    mail(to: student.email,
         subject: t('helpers.student.you_are_enrolled'))
  end
end
