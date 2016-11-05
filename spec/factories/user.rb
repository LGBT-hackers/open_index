FactoryGirl.define do
  sequence(:user_email) { |i| "user#{i}@example.com" }

  factory :user do
    email { generate(:user_email) }
    password "testtest"
    password_confirmation "testtest"
    confirmed_at Time.now
  end
end
