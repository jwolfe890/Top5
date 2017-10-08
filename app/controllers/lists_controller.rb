class ListsController < ApplicationController

  before_action :setup, only: [:create, :index]
  skip_before_filter :authenticate_user!, :only => [:index, :show, :create]

  def new
    @user = User.find_by(id: current_user.id)
    @list = List.new
    @all_topics = Topic.all
  end

  def create
    if current_user
      @user = User.find_by(id: current_user.id)
        if params[:list_topic]
          @found = List.joins(:topics).merge(Topic.where(id: params[:list_topic][:topic_id].delete_if(&:empty?)))
          render :index
        else
          @list = List.new(list_params)
            if @list.save
              redirect_to user_list_path(@user, @list)          
            else
              render :new
            end
        end
    else
      @found = List.joins(:topics).merge(Topic.where(id: params[:list_topic][:topic_id].delete_if(&:empty?)))
      render :index
    end 
  end

  def show
    @list = List.find(params[:id])
    if current_user
      @user = @list.user
      @rating = Rating.new
      @list_rating = @list.average_rating
    end
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
  end 

  def update
    @list = List.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    if @list.update(list_params)
      redirect_to user_list_path(@user, @list)
    else
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

  def find_list
    @list = List.find(params[:id])
  end

  def setup
    @recent = List.all.order(created_at: :desc)
    @submit = ListTopic.new
    @highest = List.highest_rating[0..9]
    @all_topics = Topic.all
    @lists = List.all
  end   

end
