class StudentsController < ApplicationController
  def auth
  end

  def show

  end

  def schedule
    @student = current_student

    if params[:new_course]
      # @student.courses << Course.find(params[:new_course])
      @student.courses_students.create(
        CourseStudent::CURRENT_SEMESTER.merge({ course_id: params[:new_course] })
      )
    end

    if params[:lesson_ids].try(:any?)
      @student.lesson_ids = params[:lesson_ids]

      # ConfirmScheduleEnrollmentJob.perform_later(@student)
      # NotifyAdminJob.perform_later(@student)
    end

    @days = {}
    I18n.t('date.day_names').each_with_index do |name, index|
      i = (0 == index ? 7 : index)
      @days[i] = name
    end

    @lessons = {}
    current_student.courses.each do |course|
      lessons_by_week = course.lessons.where(branch_id: current_student.branch_id).group_by { |l| l[:day_of_week] }
      (1..7).each do |day_number|
        unless lessons_by_week[day_number].present?
          lessons_by_week[day_number] = []
        end
      end

      @lessons[course.id] = lessons_by_week
    end
  end

  # Start process of payment
  def pay_online
    authenticate_student!
  end

  # Finish process of payment (callback url)
  def finish_payment
    if params[:sum].present? && params[:student_id].present? && params[:invoice_id].present?
      Student.find(params[:student_id]).payments.create!(invoice_id: params[:invoice_id],
                                                         sum: params[:sum],
                                                         accepted: true,
                                                         method: :card)
      render plain: 'Payment accepted'
    else
      render plain: 'No payment found'
    end
  end
end
