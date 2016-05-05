class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def current_ability
    @current_ability = if admin_signed_in?
                         AdminAbility.new(current_admin)
                       elsif instructor_signed_in?
                         Ability.new(current_instructor)
                       else
                         Ability.new(current_student)
                       end
  end
end
