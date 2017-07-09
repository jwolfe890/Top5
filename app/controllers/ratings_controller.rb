class RatingsController < ApplicationController

def new
  @rating = Rating.new
  render :layout => false
end 

def create
  @rating = Rating.new(rating_params)
  @list = List.find_by(id: params[:list_id])
  @rating.rated_id = @list.id
  @rating.rater_id = current_user.id
  @rating.save
  redirect_to list_path(@list)
end

private

def rating_params
  params.require(:rating).permit(:rating)
end 

end
