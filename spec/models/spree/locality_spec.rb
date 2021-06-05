# frozen_string_literal: true

RSpec.describe Spree::Locality, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:state) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
