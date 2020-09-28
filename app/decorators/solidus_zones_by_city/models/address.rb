# frozen_string_literal: true

module SolidusZonesByCity
  module Models
    module Address
      extend ActiveSupport::Concern

      included do
        belongs_to :locality, class_name: 'Spree::Locality', optional: true

        before_validation :ensure_city

        def self.build_default(*args, &block)
          country = Spree::Country.default
          where(
            country: country,
            state: country.states.first
          ).build(*args, &block)
        end
      end

      def ensure_city
        self.city = locality&.name unless city
      end
    end
  end
end

Spree::Address.include(SolidusZonesByCity::Models::Address)
