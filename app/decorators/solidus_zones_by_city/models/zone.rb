# frozen_string_literal: true

module SolidusZonesByCity
  module Models
    module Zone
      extend ActiveSupport::Concern

      included do
        with_options through: :zone_members, source: :zoneable do
          has_many :countries, source_type: 'Spree::Country'
          has_many :states, source_type: 'Spree::State'
          has_many :cities, source_type: 'Spree::Locality'
        end
      end

      def include?(address)
        return false unless address

        members.any? do |zone_member|
          zone_member.match?(address)
        end
      end

      def city_ids
        if kind == 'locality'
          members.pluck(:zoneable_id)
        else
          []
        end
      end

      def city_ids=(ids)
        set_zone_members(ids, 'Spree::Locality')
      end
    end
  end
end

Spree::Zone.prepend(SolidusZonesByCity::Models::Zone)
