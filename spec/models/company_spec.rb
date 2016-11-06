require 'rails_helper'

RSpec.describe Company, type: :model do

  context "#open_index" do
    let(:company) { create(:company) }

    it "returns correct index" do
      5.times { company.reviews << create(:review, :max, company: company) }
      expect(company.open_index).to eq 100
    end
  end

  context "lgbt_leaderboard" do
    let(:company) { create(:company) }

    it "leaderboard does not return company without reviews" do
      leaderboard = described_class.lgbt_leaderboard
      expect(leaderboard).to be_empty
    end
  end

  context "lgbt_leaderboard" do
    let!(:company_1) { create(:company_with_min_reviews) }
    let!(:company_2) { create(:company_with_medium_reviews) }
    let!(:company_3) { create(:company_with_medium_reviews) }
    let!(:company_4) { create(:company_with_max_reviews) }

    it "returns top 3 companies" do
      leaderboard = described_class.lgbt_leaderboard
      expect(leaderboard.count).to eq 3
      expect(leaderboard.map(&:first)).not_to include(company_1)
    end
  end
end
