class ListTopic < ApplicationRecord

belongs_to :list 
belongs_to :topic

def list_topic_attributes=(attributes)
  binding.pry
end

def topics_attributes=(attributes)
  binding.pry
end

def list_topics_attributes=(attributes)
  binding.pry
end 

def list_topic(attributes)
  binding.pry
end 

end