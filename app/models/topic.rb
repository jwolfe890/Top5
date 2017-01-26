class Topic < ApplicationRecord

has_many :lists, through: :list_topics
has_many :list_topics


end
