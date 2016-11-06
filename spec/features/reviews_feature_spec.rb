require 'rails_helper'

xfeature 'reviewing' do

  let!(:company) { create(:company) }
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario 'allows users to leave a review using a form' do
    visit '/companies'
    click_link company.name
    click_link "Leave Review?"
    fill_in "Description", with: "Great support for LGBT"
    choose('review_question_1_2')
    choose('review_question_2_2')
    choose('review_question_3_2')
    choose('review_question_4_2')
    choose('review_question_5_2')
    choose('review_question_6_2')
    click_button "Leave Review"
    expect(current_path).to eq "/companies/#{company.id}"
    expect(page).to have_content "Review created!"
  end

  scenario 'displays reviews on company page' do
    visit '/companies'
    click_link company.name
    click_link "Leave Review?"
    fill_in "Description", with: "Great support for LGBT"
    choose('review_question_1_2')
    choose('review_question_2_2')
    choose('review_question_3_2')
    choose('review_question_4_2')
    choose('review_question_5_2')
    choose('review_question_6_2')
    click_button "Leave Review"
    expect(page).to have_content "Great support for LGBT"
    expect(page).to have_content 2
  end

  scenario 'allows user to update their review and rating' do
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
    click_link "Edit Review"
    fill_in "Description", with: "OK support for LGBT"
    click_button "Update Review"
    expect(page).to have_content "OK support for LGBT"
  end

  scenario 'allows user to delete their review and rating' do
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
    click_link "delete Review"
    expect(page).to have_content "review deleted"
  end

end
