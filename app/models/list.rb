class List < ApplicationRecord

validates :title, :number1, :number2, :number3, :number4, :number5, presence: true

after_save :change_title

serialize :found_lists

has_many :topics, through: :list_topics
has_many :list_topics
belongs_to :user, optional: true

has_many :ratings, foreign_key: 'rated_id'
has_many :raters, through: :ratings, class_name: "User", foreign_key: 'rated_id'

scope :non_user_lists, lambda { |current| where.not(:user_id => current.id) }

    def list_topics_attributes=(attributes)
      self.list_topics.destroy_all
      attributes.values.each do |attr| 
        attr.values[0].each do |id| 
        if !id.blank? 
          topic = Topic.find_by(id: id)
          self.list_topics.build(:topic => topic)
        end
      end
    end
    end

    def self.highest_rating
       List.all.order('average_rating DESC')
    end

    def change_title
      unless self.title.match(/(Top 5 Greatest){1}\s/)
        self.title = "Top 5 Greatest #{self.title}"
        self.save
      end
    end 

end
