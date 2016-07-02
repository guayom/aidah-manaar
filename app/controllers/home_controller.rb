class HomeController < ApplicationController
  def index
  end

  def import
    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/branches.json'))
    ).each do |data|
      bb = Branch.find_by(id: data['id'])
      if !bb
        b = Branch.new(data)
        b.save(validate: false)
      else
        bb.update(data)
      end
    end

    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/students.json'))
    ).each do |data|
      ss = Student.find_by(id: data['id'])
      if !ss
        s = Student.new(data)
        s.save(validate: false)
      else
        ss.update(data)
      end
    end

    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/courses.json'))
    ).each do |data|
      cc = Course.find_by(id: data['id'])
      if !cc
        c = Course.new(data)
        c.save(validate: false)
      else
        cc.update(data)
      end
    end

    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/course_students.json'))
    ).each do |data|
      cscs = CourseStudent.find_by(id: data['id'])
      if !cscs
        cs = CourseStudent.new(data)
        cs.save(validate: false)
      else
        cscs.update(data)
      end
    end

    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/instructors.json'))
    ).each do |data|
      ii = Instructor.find_by(id: data['id'])
      if !ii
        i = Instructor.new(data)
        i.save(validate: false)
      else
        ii.update(data)
      end
    end

    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/lessons.json'))
    ).each do |data|
      ll = Lesson.find_by(id: data['id'])
      if !ll
        l = Lesson.new(data)
        l.save(validate: false)
      else
        ll.update(data)
      end
    end

    JSON.parse(
      Net::HTTP.get(URI('http://aidah-manaar.herokuapp.com/export/lesson_students.json'))
    ).each do |data|
      lsls = LessonStudent.find_by(id: data['id'])
      if !lsls
        ls = LessonStudent.new(data)
        ls.save(validate: false)
      else
        lsls.update(data)
      end
    end
  end
end
