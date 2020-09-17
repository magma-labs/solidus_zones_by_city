# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Zone do
  context 'when zone is city type' do
    let(:zone) { create(:zone, name: 'CityZone') }
    let(:city) { create(:city) }

    before do
      zone.members.create(zoneable: city)
    end

    it 'return the kind of zone member' do
      expect(zone.kind).to eq('city')
    end

    describe '#include?' do
      let(:address) { create(:address, state: city.state, city: city) }

      it 'with address from city should return true' do
        expect(zone.include?(address)).to be true
      end
    end
  end
end
