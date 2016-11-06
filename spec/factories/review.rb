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

    trait :min do
      question_1 0
      question_2 0
      question_3 0
      question_4 0
      question_5 0
      question_6 0
    end

    trait :medium do
      question_1 1
      question_2 1
      question_3 1
      question_4 1
      question_5 1
      question_6 1
    end
  end
end
