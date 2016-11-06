FactoryGirl.define do
  sequence(:company_name) { |i| "company_name_#{i}" }

  factory :company do
    name { generate(:company_name) }
    logoUrl "www.test.com"
    website "www.test.com"
    industry "test industry"
  end

  factory :company_with_min_reviews, :parent => :company do |company|
    reviews { build_list :review, 3, :min, company_id: company.id }
  end

  factory :company_with_medium_reviews, :parent => :company do |company|
    reviews { build_list :review, 3, :medium, company_id: company.id }
  end

  factory :company_with_max_reviews, :parent => :company do |company|
    reviews { build_list :review, 3, :max, company_id: company.id }
  end
end
