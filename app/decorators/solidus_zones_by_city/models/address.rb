# frozen_string_literal: true

module SolidusZonesByCity
  module Models
    module Address
      extend ActiveSupport::Concern

      included do
        belongs_to :city, class_name: 'Spree::City'

        def self.build_default(*args, &block)
          country = Spree::Country.default
          where(
            country: country,
            state: country.states.first
          ).build(*args, &block)
        end
      end
    end
  end
end

Spree::Address.include(SolidusZonesByCity::Models::Address)
