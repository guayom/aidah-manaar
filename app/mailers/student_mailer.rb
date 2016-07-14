class StudentMailer < ApplicationMailer
  def confirm_registration(student)
    @student = student
    mail(to: student.email, subject: t('devise.registrations.thank_you.title'))
  end

  def confirm_schedule_enrollment(student)
    @student = student
    @lessons = student.lessons
    mail(to: student.email,
         subject: t('helpers.student.you_are_enrolled'))
  end

  def send_invoice(invoice)
    @invoice = invoice
    mail(to: invoice.student.email, subject: t('helpers.student.you_have_new_invoice'))
  end

  def send_receipt(invoice)
    @invoice = invoice
    mail(to: invoice.student.email, subject: t('helpers.student.new_receipt'))
  end
end
