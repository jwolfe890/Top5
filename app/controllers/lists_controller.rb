class ListsController < ApplicationController

def new
  @list = List.new
  @user = User.find_by(id: params[:user_id])
  @all_topics = Topic.all
  @list.list_topics.build 
end

def create
  @list = List.new(list_params)
  binding.pry
end

private

def list_params
  params.require(:list).permit(:subject, :list_topics_attributes => [:topic, :content, :topic_ids, :id, :ids])
end  



end
