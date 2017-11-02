class User < ApplicationRecord

serialize :found_lists

  validates :email, :uniqueness => {:allow_blank => true}
  
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

end
