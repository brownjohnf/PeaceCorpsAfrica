class ApplicationController < ActionController::Base

  before_filter :handle_cookies

  protect_from_forgery

  check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def handle_cookies
    if params[:country_code]
      cookies[:country] = Carmen.country_name(params[:country_code])
    elsif params[:abbreviation]
      cookies[:country] = params[:abbreviation]
    else
      cookies[:country] = 'Africa'
    end
  end

end
