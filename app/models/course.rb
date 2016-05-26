class Course < ActiveRecord::Base
  extend FriendlyId

  has_closure_tree
  has_many :lessons
  has_many :courses_students, class_name: 'CourseStudent', dependent: :destroy
  has_many :students, through: :courses_students
  has_many :requirements
  has_many :required_courses, through: :requirements, source: :requirement

  # TODO Add validation to control that there is only one base course (course without parent).

  default_scope { order(:name) }

  scope :base, -> { find_by(parent_id: nil) }

  friendly_id :name, use: :slugged

  validate :can_be_only_one_base_course

  def to_s
    name
  end

  def parent_name
    parent.try(:name)
  end

  def can_be_only_one_base_course
    if parent.nil?
      if Course.where(parent: nil).any?
        errors.add(:parent_id, :invalid)
      end
    end
  end
end
