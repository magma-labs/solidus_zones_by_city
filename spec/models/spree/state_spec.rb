# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::State, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:cities) }
  end
end
