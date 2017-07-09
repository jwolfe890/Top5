class ListsController < ApplicationController

  before_action :find_user, except: [:index, :show, :destroy, :edit, :next]
  before_action :find_list, except: [:new, :create, :index]


  def new
    @list = List.new
    @all_topics = Topic.all
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
        end
    end 
  end

  def show
    @user = @list.user
    @rating = Rating.new
    @list.save
    @form = true
    render json: @list  
  end

  def edit
    if params[:user_id]
      @user = User.find(params[:user_id])
      @list2 = List.new
      @list.title = @list.title.sub(/(Top 5 Greatest){1}\s/, '')
      @all_topics = Topic.all
    else
      flash[:notice] = "You have to be the list creator to edit."
      redirect_to user_path(current_user.id)
      end   
  end

  def index
    @all_lists = List.all
    render json: @all_lists 
  end 

  def update
    if @list.update(list_params)
      redirect_to user_list_path(@user, @list)
    else
      render :edit
    end 
  end

  def next
    @next_post = @list.next
    render json: @next_post
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
