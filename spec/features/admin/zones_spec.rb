# frozen_string_literal: true

require 'spec_helper'

describe 'Zones admin page', type: :feature, js: true do
  stub_authorization!

  let!(:city) { create(:city) }

  before do
    visit spree.new_admin_zone_path
  end

  context 'when successfully create city level zone' do
    before do
      fill_in 'zone_name', with: 'City Zone'
      find('#city_based').choose
      fill_in 's2id_autogen3', with: city.name
      find('.select2-results li:first-child').click
      click_on('Create')
    end

    it 'redirect to admin_zones page' do
      expect(page).to have_current_path spree.admin_zones_path
    end

    it 'creates city level zone' do
      expect(page).to have_content('City Zone')
    end
  end

  context 'when just visit admin zones page' do
    it 'show state based form' do
      expect(page).to have_css('#state_members')
    end

    it 'dont show country based form' do
      expect(page).not_to have_css('#country_members')
    end

    it 'dont show city based form' do
      expect(page).not_to have_css('#city_members')
    end
  end

  context 'when choose city based' do
    it 'only show selected type form'
  end
end
