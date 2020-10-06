# frozen_string_literal: true

FactoryBot.define do
  factory :city, class: 'Spree::Locality' do
    name { 'Birmingham' }
    transient do
      country_iso_code { 'US' }
      state_code { 'AL' }
    end

    state do |locality|
      Spree::State.joins(:country).where('spree_countries.iso = (?)', country_iso_code).find_by(abbr: state_code) ||
        locality.association(:state, country_iso: country_iso_code, state_code: state_code)
    end
  end
end

FactoryBot.modify do
  factory :address, class: 'Spree:Address' do
    transient do
      city_name { 'Birmingham' }
    end

    locality do |address|
      state = address.state
      Spree::Locality.find_by(name: city_name, state: state) ||
        create(:city, name: city_name, state: state)
    end
  end
end

FactoryBot.modify do
  factory :stock_location, class: 'Spree:StockLocation' do
    transient do
      city_name { 'Seattle' }
      country_iso_code { 'US' }
      state_code { 'WA' }
    end

    state do |stock_location|
      Spree::State.joins(:country).where('spree_countries.iso = (?)', country_iso_code).find_by(abbr: state_code) ||
        stock_location.association(:state, country_iso: country_iso_code, state_code: state_code)
    end

    locality do |stock_location|
      state = stock_location.state
      Spree::Locality.find_by(name: city_name, state: state) ||
      create(:city, name: city_name, state: state)
    end
  end
end
