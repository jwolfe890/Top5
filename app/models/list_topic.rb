class ListTopic < ApplicationRecord

  belongs_to :list, :optional => true
  belongs_to :topic, :optional => true

  scope :topic_finder, lambda { |item| where(topic_id: Topic.find(item).id) }

end