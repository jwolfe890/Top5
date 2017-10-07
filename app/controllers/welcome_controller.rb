class WelcomeController < ApplicationController

skip_before_filter :authenticate_user!

  def home
    unless !user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

end