class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :number1

  belongs_to :user, optional: true
end
