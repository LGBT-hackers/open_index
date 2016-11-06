class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flags
  has_many :reviews
  has_many :flagged_reviews, through: :flags, source: :review


 def has_flagged?(review)
   flagged_reviews.include? review
 end
end
