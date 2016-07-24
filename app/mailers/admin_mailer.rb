class AdminMailer < ApplicationMailer
  def notify_about_registration(student)
    @student = student
    mail(to: Admin.where(main: true).pluck(:email),
         subject: t('helpers.admin.new_student_added'))
  end

  def notify_about_partial_invoice(invoice)
    @invoice = invoice
    mail(to: Admin.where(main: true).pluck(:email),
         subject: t('helpers.admin.new_partial_invoice_added'))
  end
end
