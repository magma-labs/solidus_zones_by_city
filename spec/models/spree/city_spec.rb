# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::City, type: :model do
  context 'associations' do
    it { should belong_to(:state) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:state_id) }
  end
end
