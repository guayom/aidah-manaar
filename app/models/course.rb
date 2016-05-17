class Course < ActiveRecord::Base
  extend FriendlyId

  has_closure_tree
  has_many :lessons
  has_many :courses_students, class_name: 'CourseStudent', dependent: :destroy
  has_many :students, through: :courses_students

  rails_admin do
    list do
      field :name
      field :parent_name
      field :level
    end

    edit do
      exclude_fields :children, :self_and_ancestors, :self_and_descendants

      field :public_description, :bootsy
    end
  end

  # TODO Add validation to control that there is only one base course (course without parent).

  default_scope { order(:name) }

  scope :base, -> { find_by(parent_id: nil) }

  friendly_id :name, use: :slugged

  def to_s
    name
  end

  def parent_name
    parent.try(:name)
  end
end
