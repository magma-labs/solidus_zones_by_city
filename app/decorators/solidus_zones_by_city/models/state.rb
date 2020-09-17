# frozen_string_literal: true

module SolidusZonesByCity
  module Models
    module State
      extend ActiveSupport::Concern

      included do
        has_many :cities, class_name: 'Spree::City', dependent: :destroy
      end
    end
  end
end

Spree::State.include(SolidusZonesByCity::Models::State)
