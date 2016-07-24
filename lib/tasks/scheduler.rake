task :update_feed => :environment do
  puts 'Creating monthly invoices...'

  Student.find_by(id: 232).create_invoice!

  puts 'done.'
end
