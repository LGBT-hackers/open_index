FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "testtest"
    password_confirmation "testtest"
    confirmed_at Time.now
  end
end
