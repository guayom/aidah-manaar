json.success 1
json.result @lessons do |lesson|
  json.id lesson.id

  json.title lesson.time_interval

  json.url lesson_path(lesson)
  json.start (Date.today.beginning_of_week + (lesson[:day_of_week] - 1).days +
               lesson.start_time.seconds_since_midnight.seconds).to_datetime.strftime('%Q')
  json.end (Date.today.beginning_of_week + (lesson[:day_of_week] - 1).days +
              lesson.end_time.seconds_since_midnight.seconds).to_datetime.strftime('%Q')

  if lesson.students.include?(current_student)
    json.class 'event-success'
  end
end
