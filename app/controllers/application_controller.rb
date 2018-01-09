class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_sign_up_role, if: :devise_controller?



  def set_sign_up_role
    session[:role] = params[:as] if params[:as]
  end

  def after_sign_in_path_for(resource)
    if resource.user?
      client_treatments_path
    elsif resource.client?
      client_treatments_path
    elsif resource.admin?
      users_path
    end
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

end
