require 'rails_helper'

feature 'companies leaderboard' do

  let!(:company_1) { create(:company_with_min_reviews) }
  let!(:company_2) { create(:company_with_medium_reviews) }
  let!(:company_3) { create(:company_with_medium_reviews) }
  let!(:company_4) { create(:company_with_max_reviews) }

  
end
