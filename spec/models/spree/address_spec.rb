# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Address, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:city) }
  end
end
