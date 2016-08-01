class Ability
  include CanCan::Ability

  def initialize(user)
    # can :export, :data

    can :read, Course

    if user.present?
      if user.instance_of?(Student)
        can [:read_full_description, :select_schedule], Course do |course|
          user.courses.include?(course)
        end

        can :enroll, Course do |course|
          user.courses.exclude?(course)
        end

        can :create, CourseStudent, student_id: user.id
      end
    end

    # if user.present?
    #   can :read, Lesson
    #
    #   can :create, CourseStudent
    #   can :create, LessonStudent
    # end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
