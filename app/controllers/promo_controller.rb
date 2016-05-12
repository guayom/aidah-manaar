class PromoController < ApplicationController
  before_action :authenticate_student!, except: [:registration]

  def registration
    if student_signed_in?
      redirect_to select_schedule_path
    else
      redirect_to new_student_registration_path
    end
  end

  def select_schedule
    @student = current_student
    if @student.lessons.any? || !@student.beginner?
      redirect_to thank_you_path
    end

    @days = {}
    I18n.t('date.day_names').each_with_index do |name, index|
      i = (0 == index ? 7 : index)
      @days[i] = name
    end

    @course = Course.base

    @lessons_by_week = @course.lessons.group_by { |l| l[:day_of_week] }
    (1..7).each do |day_number|
      unless @lessons_by_week[day_number].present?
        @lessons_by_week[day_number] = []
      end
    end

    # start_time = Time.parse('00:00')
    # times = [start_time]
    # 48.times do |n|
    #   times << (start_time + n * 30.minutes)
    # end
    #
    # (1..7).each do |day_number|
    #   lessons = @lessons_by_week[day_number]
    #
    #   lessons_by_time = Hash.new([])
    #   times.each do |t|
    #     lessons.each do |lesson|
    #       if lesson.start_time.utc.strftime('%H%M%S%N') >= t.utc.strftime('%H%M%S%N') &&
    #         lesson.start_time.utc.strftime('%H%M%S%N') < (t + 30.minutes).utc.strftime('%H%M%S%N')
    #
    #         fail '234'
    #         lessons_by_time[t] << lesson
    #       end
    #     end
    #   end
    #
    #   @lessons_by_week[day_number] = lessons_by_time
    # end
  end

  def thank_you
    @student = current_student
  end
end
