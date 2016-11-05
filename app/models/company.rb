class Company < ApplicationRecord

  has_many :reviews

  def open_index
    max_score = reviews.count * 12
    reviews.map(&:total_rating).reduce(:+) / max_score * 100
  end
end
