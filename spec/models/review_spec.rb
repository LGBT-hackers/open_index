require 'rails_helper'

RSpec.describe Review, type: :model do
  context "properties" do
    it { is_expected.to respond_to(:description)}
  end
end
