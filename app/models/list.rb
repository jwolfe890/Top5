class List < ApplicationRecord

has_many :topics, through: :list_topics
has_many :list_topics

belongs_to :user, optional: true


def topics_attributes=(attributes)
  binding.pry
  attributes.values.each do |attr|  
    attr.values[0].each do |id| 
    if !id.blank? 
      topic = Topic.find_by(id: id)
      self.topics << topic
  end
  end
end
end 

end
