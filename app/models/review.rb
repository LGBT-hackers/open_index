class Review < ApplicationRecord
  validates :user_id, uniqueness: { scope: :company_id }
  validates_presence_of :question_1
  validates_presence_of :question_2
  validates_presence_of :question_3
  validates_presence_of :question_4
  validates_presence_of :question_5
  validates_presence_of :question_6
  validates_presence_of :description

  belongs_to :user
  belongs_to :company

  has_many :flags

  def average_review_rating
    total_rating.to_f / 6
  end

  def total_rating
    (question_1 + question_2 + question_3 + question_4 + question_5 + question_6)
  end
end
