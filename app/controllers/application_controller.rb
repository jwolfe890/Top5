class ApplicationController < ActionController::Base

  before_filter :require_login

  protect_from_forgery with: :exception

def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || root_path
end

private

  def require_login
    unless current_user
      redirect_to '/'
    end
  end


end
