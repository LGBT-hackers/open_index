require 'rails_helper'

RSpec.describe Review, type: :model do

  context "#open_index" do
    let(:company) { create(:company) }

    it "returns correct index" do
      5.times { company.reviews << create(:review, :max, company: company) }
      expect(company.open_index).to eq 100
    end
  end
end
