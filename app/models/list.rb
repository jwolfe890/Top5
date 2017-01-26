class List < ApplicationRecord

has_many :topics, through: :list_topics
has_many :list_topics

def topics_attributes=(attributes)
  binding.pry
end

def list_topic_attributes=(attributes)
  binding.pry
end 

def list_topic(attributes)
  binding.pry
end 

def list_topics_attributes=(attributes)
  binding.pry
end 

def topic_attributes=(attributes)
  binding.pry
end 

end
