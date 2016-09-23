task :import => :environment do
  puts 'Importing new students from Register site...'

  JSON.parse(
    Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/students.json'))
  ).each do |data|
    ss = Student.find_by(id: data['id'])
    if ss.blank?
      s = Student.new(data)
      s.save!(validate: false)
    end
  end

  puts 'done.'
end
