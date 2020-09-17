# frozen_string_literal: true

FactoryBot.define do
  factory :city, class: 'Spree::City' do
    name { 'Birmingham' }
    transient do
      country_iso_code { 'US' }
      state_code { 'AL' }
    end

    state do |city|
      Spree::State.joins(:country).where('spree_countries.iso = (?)', country_iso_code).find_by(abbr: state_code) ||
        city.association(:state, country_iso: country_iso_code, state_code: state_code)
    end
  end
end

FactoryBot.modify do
  factory :address, class: 'Spree:Address' do
    city { create(:city) }
  end
end

FactoryBot.modify do
  factory :stock_location, class: 'Spree:StockLocation' do
    city { create(:city, name: 'Seattle', state_code: 'WA', country_iso_code: 'US') }
  end
end
