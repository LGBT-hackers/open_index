require 'rails_helper'

RSpec.describe Rating, type: :model do

  context "ratings" do
    let(:user) { create(:user) }
    let(:company) { create(:company) }

    it "cannot be created twice" do
      create(:rating, company: company, user: user)
      expect { create(:rating, company: company, user: user) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
