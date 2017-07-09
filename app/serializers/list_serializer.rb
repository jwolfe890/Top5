class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :number1, :number2, :number3, :number4, :number5, :average_rating
  has_many :topics
end
