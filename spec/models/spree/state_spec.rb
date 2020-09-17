# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::State, type: :model do
  context 'associations' do
    it { should have_many(:cities) }
  end
end
