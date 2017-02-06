class ListsController < ApplicationController

  before_action :find_user, except: [:index, :show, :destroy]
  before_action :find_list, except: [:new, :create, :index]

  def new
    @list = List.new
    @all_topics = Topic.all
    @list.list_topics.build 
  end

  def create
    if params[:list_topic]
      @user.found_lists = []
      array = params[:list_topic][:topic_id].delete_if(&:empty?)
      @user.finder(array)
      redirect_to profile_path(:param1 => 1) 
    else
      @list = List.new(list_params)
        if @list.save
          redirect_to user_list_path(@user, @list)          
        else
          render :new
          @list.save
        end
    end 
  end

  def show
    @rating = Rating.new
    @list.save
  end

  def edit
    @list2 = List.new
    @list2.list_topics.new
    @list.title = @list.title.sub(/(Top 5 Greatest){1}\s/, '')
    @all_topics = Topic.all
  end

  def index
    @all_lists = List.non_user_lists(current_user)
  end 

  def update
    if @list.update(list_params)
      redirect_to user_list_path(@user, @list)
    else
      @list2 = List.new
      @all_topics = Topic.all
      render :edit
    end 
  end

  def destroy
    @user = @list.user
    @list.delete
    redirect_to user_path(@user)
  end  

private

  def list_params
    params.require(:list).permit(:title, :number1, :number2, :number3, :number4, :number5, :user_id, :list_topics_attributes => [topic_id: []])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_list
    @list = List.find(params[:id])
  end  

end
