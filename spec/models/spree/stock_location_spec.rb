# frozen_string_literal: true

RSpec.describe Spree::StockLocation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:locality).optional }
  end
end
