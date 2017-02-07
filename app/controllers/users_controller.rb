class UsersController < ApplicationController
  
  def show
    if !user_signed_in?
      redirect_to '/'
    end

    if params[:param1]
      @user = User.find_by(id: current_user.id)
      @all_topics = Topic.all
      @submit = ListTopic.new
      @lists = @user.lists
      @recent = List.all.recent
      @highest = List.highest_rating
    else
      @user = User.find_by(id: current_user.id)
      @user.found_lists = nil
      @all_topics = Topic.all
      @submit = ListTopic.new
      @lists = @user.lists
      @recent = List.all.recent
      @highest = List.highest_rating
    end
  end

end
