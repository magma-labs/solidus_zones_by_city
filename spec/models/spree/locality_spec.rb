# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Locality, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:state) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:state_id).case_insensitive }
  end
end
