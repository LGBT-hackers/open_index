FactoryGirl.define do
  factory :review do
    description "Great"
    company { create(:company) }
    user { create(:user) }

    trait :max do
      question_1 2
      question_2 2
      question_3 2
      question_4 2
      question_5 2
      question_6 2
    end
  end
end
