json.success 1
json.result @lessons do |lesson|
  json.id lesson.id
  json.title lesson.course.name
  json.url lesson_path(lesson)
  json.start lesson.start_time.to_datetime.strftime('%Q')
  json.end lesson.end_time.to_datetime.strftime('%Q')
end
