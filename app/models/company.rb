class Company < ApplicationRecord
  validates :name, uniqueness: { message: '"%{value}" already exists.' }

  has_many :reviews

  def self.lgbt_leaderboard
    result = Company.all.each_with_object({}) do |company, hash|
      hash[company] = company.open_index
    end
    result.sort_by { |company, index| index }.reverse.take(3)
  end

  def open_index
    max_score = reviews.count * 24
    reviews.map(&:total_rating).reduce(:+).to_f / max_score.to_f * 100
  end
end
