require 'rails_helper'

feature 'reviewing' do

  let!(:company) { create(:company) }
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario 'allows users to leave a review using a form' do
    visit '/'
    p page.body
    click_link company.name
    click_link "Review #{company.name}"
    fill_in "description", with: "Great support for LGBT"
    click_button "Leave Review"
    expect(current_page).to eq '/companies'
    expect(page).to have_content "Great support for LGBT"
  end

end
