desc 'Create monthly invoices for all students with active subscriptions and send them by email.'
task create_invoices: :environment do
  puts 'Creating monthly invoices...'

  # if Task.need?('create_invoices')
    Student.all.each do |student|
      invoice = student.create_invoice!
      # if invoice.present?
      #   invoice.send!
      # end
    end
    # Task.finish!('create_invoices')
  # end

  puts 'done.'
end
