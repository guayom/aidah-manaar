class Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def create
    super

    # TODO ConfirmRegistrationJob.perform_later(resource)

    if resource.persisted?
      if 'yes' == params[:student][:start_now]
        Course.base.students << resource
        # TODO ConfirmCourseEnrollmentJob.perform_later(resource, Course.base)

        set_flash_message!(
          :notice,
          'Welcome! You have signed up and successfully enrolled to your first course.'
        )
      else
        set_flash_message!(
          :notice,
          %q(Welcome! You have signed up successfully. We'll contact you soon.)
        )
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.
      permit(:sign_up, keys: [:first_name, :last_name, :phone, :branch_id])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.
      permit(:account_update, keys: [:first_name, :last_name, :phone, branch_id])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def after_sign_in_path_for(resource)
    flash[:alert] = nil

    courses_path
  end
end
