# frozen_string_literal: true

require 'spec_helper'

describe 'Zones admin page', type: :feature, js: true do
  stub_authorization!

  let!(:city) { create(:city) }

  before do
    visit spree.new_admin_zone_path
    fill_in 'zone_name', with: 'City Zone'
    find('#city_based').choose
    fill_in 's2id_autogen3', with: city.name
    find('.select2-results li:first-child').click
    click_on('Create')
    page.have_current_path spree.admin_zones_path
  end

  it 'creates city level zone' do
    expect(page).to have_content('City Zone')
  end
end
