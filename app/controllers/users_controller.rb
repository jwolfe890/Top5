class UsersController < ApplicationController
  
  def show
    if !user_signed_in?
      redirect_to '/'
    end
    @lists = current_user.lists
  end

end
