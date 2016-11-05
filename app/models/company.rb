class Company < ApplicationRecord
  validates :name, uniqueness: { message: '"%{value}" already exists.' }

  has_many :reviews

  def open_index
    max_score = reviews.count * 12
    reviews.map(&:total_rating).reduce(:+).to_f / max_score.to_f * 100
  end
end
