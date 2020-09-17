# frozen_string_literal: true

module SolidusZonesByCity
  module Models
    module StockLocation
      extend ActiveSupport::Concern

      included do
        belongs_to :city, class_name: 'Spree::City'
      end
    end
  end
end

Spree::StockLocation.include(SolidusZonesByCity::Models::StockLocation)
