class User < ApplicationRecord

require 'List'

serialize :found_lists
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :ratings, foreign_key: 'rater_id'
  has_many :rated, through: :ratings, class_name: "List", foreign_key: 'rater_id'

  has_many :lists
  
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end

    def finder(array)
      @found = []
        array.each do |number|
          @found << ListTopic.topic_finder(number)
        end
      list_one = []
      @found.flatten.each do |list2|
        list_one << List.find_by(id: list2.list_id)
      end
      list_one
        self.found_lists << list_one.uniq
        self.save
    end

end
