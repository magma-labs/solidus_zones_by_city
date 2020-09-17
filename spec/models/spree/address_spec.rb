# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Address, type: :model do
  context 'associations' do
    it { should belong_to(:city) }
  end
end
