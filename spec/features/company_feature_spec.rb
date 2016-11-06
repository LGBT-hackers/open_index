require 'rails_helper'

feature 'company' do

  let!(:company) { create(:company) }
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario 'allows user to see company_index' do
    visit '/companies'
    click_link company.name
    click_button "Leave Review?"
    fill_in "Description", with: "Great support for LGBT"
    choose('review_question_1_2')
    choose('review_question_2_2')
    choose('review_question_3_2')
    choose('review_question_4_2')
    choose('review_question_5_2')
    choose('review_question_6_2')
    click_button "Leave Review"
    expect(page).to have_content 'Open Index: 50'
  end
end
