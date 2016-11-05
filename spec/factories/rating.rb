FactoryGirl.define do
  factory :rating do
    category "LGBT"
    company { create(:company) }
    user { create(:user) }
    question_1 2
    question_2 2
    question_3 2
    question_4 2
    question_5 2
    question_6 2
    # created_at
    # updated_at
  end
end
