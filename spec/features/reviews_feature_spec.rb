require 'rails_helper'

feature 'reviewing' do

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
    fill_in 'Question 1', with: 2
    fill_in 'Question 2', with: 2
    fill_in 'Question 3', with: 2
    fill_in 'Question 4', with: 2
    fill_in 'Question 5', with: 2
    fill_in 'Question 6', with: 2
    click_button "Leave Review"
    expect(current_path).to eq "/companies/#{company.id}"
    expect(page).to have_content "Review created!"
  end

end
