# frozen_string_literal: true

RSpec.describe Spree::Address, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:locality).optional }
  end

  describe '#ensure_city' do
    let(:locality) { create(:city) }

    it 'update city when not present' do
      address = described_class.new(locality: locality)
      address.ensure_city
      expect(address.city).to eq(locality.name)
    end

    it 'dont update city when present' do
      city_name = 'FooLand'
      address = described_class.new(locality: locality, city: city_name)
      address.ensure_city
      expect(address.city).to eq(city_name)
    end
  end
end
