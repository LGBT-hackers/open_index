class Company < ApplicationRecord
  validates :name, uniqueness: { message: '"%{value}" already exists.' }
end
