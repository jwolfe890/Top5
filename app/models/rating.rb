class Rating < ApplicationRecord

after_save :calculate_average

belongs_to :rater, class_name: "User", optional: true
belongs_to :rated, class_name: "List", optional: true

private

def calculate_average
  @list = List.find_by(id: self.rated_id)
  @list.average_rating = @list.ratings.average(:rating).to_i
  @list.save
end 


end