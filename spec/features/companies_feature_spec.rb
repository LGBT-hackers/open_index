require 'rails_helper'

feature 'companies leaderboard' do

  let!(:company_1) { create(:company_with_min_reviews) }
  let!(:company_2) { create(:company_with_medium_reviews) }
  let!(:company_3) { create(:company_with_medium_reviews) }
  let!(:company_4) { create(:company_with_max_reviews) }

  scenario "user sees only top 3 companies" do
    visit '/companies'
    expect(page).to have_content(company_4.name)
    expect(page).to have_content(company_3.name)
    expect(page).to have_content(company_2.name)
    expect(page).not_to have_content(company_1.name)
  end
end
