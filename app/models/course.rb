class Course < ActiveRecord::Base
  extend FriendlyId

  has_closure_tree
  has_many :lessons
  has_many :courses_students, class_name: 'CourseStudent', dependent: :destroy
  has_many :students, through: :courses_students

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

  def as_json(options = nil)
    attrs = {
      only: [
        'id',
        'name',
        'public_description',
        'level',
        'created_at',
        'updated_at',
        'parent_id',
        'slug',
        'full_description'
      ]
    }

    super(attrs.merge(options || {}))
  end
end
