require 'rails_helper'

RSpec.describe Review, type: :model do
  context "properties" do
    it { is_expected.to respond_to(:description)}
  end

  context "reviews" do
    let(:user) { create(:user) }
    let(:company) { create(:company) }
    it "cannot be created twice" do
      create(:review, :medium, company: company, user: user)
      expect { create(:review, :medium, company: company, user: user) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
