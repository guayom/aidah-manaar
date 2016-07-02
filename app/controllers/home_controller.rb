class HomeController < ApplicationController
  def index
  end

  def import
    students_json = JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/students.json'))
    )
    fail students_json.inspect
  end
end
