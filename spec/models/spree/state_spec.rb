# frozen_string_literal: true

RSpec.describe Spree::State, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:localities) }
  end
end
