class ListsController < ApplicationController

  def new
    @list = List.new
    @user = User.find_by(id: params[:user_id])
    @all_topics = Topic.all
    @list.topics.build 
  end

  def create
    binding.pry
    # Could add a hidden_field for the user_id
    @user = User.find_by(id: params[:user_id])
    @list = @user.lists.build(list_params)
    binding.pry
    if @user.save
      redirect_to edit_list_path(@list.id) 
      # user_list_path(@user.id, @user.lists.last.id) 
    end
  end

  def show

  end

  def edit
    binding.pry
    @list = List.find_by(id: params[:id])
    @user = User.find_by(id: @list.user_id)
    @all_topics = Topic.all
  end

  def update
    binding.pry
    @list = List.find(params[:id])
    @list.update(list_params)
    binding.pry
  end 

private

  def list_params
    params.require(:list).permit(:subject, :topics_attributes => [:id, id: []])
  end
end
