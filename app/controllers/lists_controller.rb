class ListsController < ApplicationController

  def new
    @list = List.new
    @user = User.find_by(id: params[:user_id])
    @all_topics = Topic.all
    @list.list_topics.build 
  end

  def create
    if params[:list_topic]
      @user = User.find_by(id: params[:user_id])
      @user.found_lists = []
      array = params[:list_topic][:topic_id].delete_if(&:empty?)
      @user.finder(array)
      redirect_to profile_path(:param1 => 1) 
    else
      @user = User.find_by(id: params[:user_id])
      @list = List.new(list_params)
        if @list.save
          redirect_to user_list_path(@user, @list)
        end
    end 
  end

  def show
    @rating = Rating.new
    @user = User.find_by(id: params[:user_id])
    @list = List.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @list = List.find_by(id: params[:id])
    @list.title = @list.title.sub(/(Top 5 Greatest){1}\s/, '')
    @list2 = List.new
    @all_topics = Topic.all
  end

  def index
    @all_lists = List.non_user_lists(current_user)
  end 

  def update
    @user = User.find_by(id: params[:list][:user_id])
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to user_list_path(@user, @list)
    end 
  end 

private

  def list_params
    params.require(:list).permit(:title, :number1, :number2, :number3, :number4, :number5, :user_id, :list_topics_attributes => [topic_id: []])
  end
end
