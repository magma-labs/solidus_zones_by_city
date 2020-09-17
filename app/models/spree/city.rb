# frozen_string_literal: true

module Spree
  class City < Spree::Base
    belongs_to :state, class_name: 'Spree::State'
    has_one :country, through: :state

    validates :name, presence: true, uniqueness: { scope: :state_id }
  end
end
