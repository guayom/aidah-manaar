class HomeController < ApplicationController
  def index
  end

  def import
    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/branches.json'))
    ).each do |data|
      if !Branch.find_by(id: data['id'])
        b = Branch.new(data)
        b.save(validate: false)
      end
    end

    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/students.json'))
    ).each do |data|
      if !Student.find_by(id: data['id']) && !Student.find_by(email: data['email'])
        s = Student.new(data)
        s.save(validate: false)
      end
    end
  end
end
