class ApplicationController < ActionController::Base
  before_action :set_meta
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_flash

  helper :flash_messages
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name terms_and_conditions])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end
  
  def set_flash
    @flash = flash
  end

  def set_meta
    @meta_portfolio_description = "Experienced Full-Stack Software Engineer with a focus on agile development for the edtech and ecommerce industries. Proficient in Tailwind CSS and PostgreSQL, I specialize in crafting seamless web applications with clean, efficient code and innovative solutions. Currently engaged in generative AI studies. Let's bring your ideas to life with technology expertise."
    @meta_portfolio_keywords = "Full-Stack developer, Software Engineer, Tailwind CSS, PostgreSQL, agile development, edtech, ecommerce, generative AI studies"
    @meta_description = @meta_portfolio_description
    @meta_keywords = @meta_portfolio_keywords
  end
end
