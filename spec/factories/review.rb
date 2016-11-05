FactoryGirl.define do
  factory :review do
    description "Great"
    company { create(:company) }
    user { create(:user) }
  end
end
