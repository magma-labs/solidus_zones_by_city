# frozen_string_literal: true

module SolidusZonesByCity
  module Models
    module StockLocation
      extend ActiveSupport::Concern

      included do
        belongs_to :locality, class_name: 'Spree::Locality', optional: true
      end
    end
  end
end

Spree::StockLocation.include(SolidusZonesByCity::Models::StockLocation)
