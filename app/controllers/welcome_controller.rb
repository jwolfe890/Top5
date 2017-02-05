class WelcomeController < ApplicationController

  def home
    unless !user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

end