class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.is_admin?
      sign_out(current_user)
      redirect_to(new_user_session_path, notice: 'You are not an admin user!')
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
  end

end


