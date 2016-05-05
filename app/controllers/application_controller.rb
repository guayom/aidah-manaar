class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_ability
    @current_ability = if admin_signed_in?
                         Ability.new(current_admin)
                       elsif instructor_signed_in?
                         Ability.new(current_instructor)
                       else
                         Ability.new(current_student)
                       end
  end
end
