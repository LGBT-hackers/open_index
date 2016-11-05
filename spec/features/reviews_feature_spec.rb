require 'rails_helper'

feature 'reviewing' do

  let!(:company) { create(:company) }

  before do
    sign_up
  end

  scenario 'allows users to leave a review using a form' do
    visit '/'
    click_link "Review Great Company"
    fill_in "description", with: "Great support for LGBT"
    click_button "Leave Review"
    expect(current_page).to eq '/companies'
    expect(page).to have_content "Great support for LGBT"
  end
  
end
