class WelcomeController < ApplicationController

skip_before_filter :require_login

layout false

  def home
    unless !user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

end