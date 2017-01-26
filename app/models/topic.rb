class Topic < ApplicationRecord

has_many :lists, through: :list_topics
has_many :list_topics


def topic_attributes=
  binding.pry
end 

def topics_attributes=
  binding.pry
end 

end
