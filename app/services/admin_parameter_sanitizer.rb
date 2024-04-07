# app/services/user_parameter_sanitizer.rb
class AdminParameterSanitizer < Devise::ParameterSanitizer
  private
  def sign_up
    default_params.permit(:email, :password, :password_confirmation, :username, :avatar)
  end

  def account_update
    default_params.permit(:email, :password, :password_confirmation, :current_password, :username, :avatar)
  end
end
