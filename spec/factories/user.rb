FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "testtest"
    password_confirmation "testtest"
  end
end
