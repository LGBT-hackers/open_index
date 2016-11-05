class Review < ApplicationRecord
  validates :user_id, uniqueness: { scope: :company_id }

  belongs_to :user
  belongs_to :company

  def average_review_rating
    total_rating.to_f / 6
  end

  def total_rating
    (question_1 + question_2 + question_3 + question_4 + question_5 + question_6)
  end
end
