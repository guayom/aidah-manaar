class HomeController < ApplicationController
  def index
  end

  def import
    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/students.json'))
    ).each do |data|
      if !Student.find_by(id: data['id'])
        s = Student.new(data)
        s.save(validate: false)
      end
    end
  end
end
