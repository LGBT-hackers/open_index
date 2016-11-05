class Rating < ApplicationRecord
  validates :user_id, uniqueness: { scope: :company_id }

  belongs_to :user
  belongs_to :company
end
