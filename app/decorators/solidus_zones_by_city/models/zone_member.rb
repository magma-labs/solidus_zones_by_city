# frozen_string_literal: true

module SolidusZonesByCity
  module Models
    module ZoneMember
      def match?(address)
        case zoneable_type
        when 'Spree::Country'
          zoneable_id == address.country_id
        when 'Spree::State'
          zoneable_id == address.state_id
        when 'Spree::City'
          zoneable_id == address.city_id
        else
          false
        end
      end
    end
  end
end

Spree::ZoneMember.include(SolidusZonesByCity::Models::ZoneMember)
