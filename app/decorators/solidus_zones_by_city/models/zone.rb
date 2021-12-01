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

        scope :with_member_ids, lambda { |city_ids, state_ids, country_ids|
          if city_ids.blank? && state_ids.blank? && country_ids.blank?
            none
          else
            spree_zone_members_table = Spree::ZoneMember.arel_table
            matching_city =
              spree_zone_members_table[:zoneable_type].eq('Spree::Locality')
                  .and(spree_zone_members_table[:zoneable_id].in(city_ids))
            matching_state =
              spree_zone_members_table[:zoneable_type].eq('Spree::State')
                  .and(spree_zone_members_table[:zoneable_id].in(state_ids))
            matching_country =
              spree_zone_members_table[:zoneable_type].eq('Spree::Country')
                  .and(spree_zone_members_table[:zoneable_id].in(country_ids))
            joins(:zone_members).where(matching_city.or(matching_state.or(matching_country))).distinct
          end
        }

        scope :for_address, lambda { |address|
          if address
            with_member_ids(address.locality_id, address.state_id, address.country_id)
          else
            none
          end
        }
      end

      def self.with_shared_members(zone)
        return none unless zone

        cities_and_city_state_ids = zone.cities.pluck(:id, :state_id).to_a
        city_ids = cities_and_city_state_ids.map(&:first)
        states_and_state_country_ids = zone.states.pluck(:id, :country_id).to_a
        all_state_ids = cities_and_city_state_ids.map(&:second).uniq
            .concat(states_and_state_country_ids.map(&:first))
        all_country_ids = Spree::State.find(city_state_ids).pluck(:country_id).to_a
            .concat(states_and_state_country_ids.map(&:second))
            .concat(zone.countries.pluck(:id).to_a)

        with_member_ids(city_ids, all_state_ids, all_country_ids).distinct
      end

      def country_list
        @countries ||= case kind # rubocop:disable Naming/MemoizedInstanceVariableName
                       when 'country' then zoneables
                       when 'state' then zoneables.collect(&:country)
                       when 'locality'
                         Spree::State.find(zone.zoneables.pluck(:state_id)).collect(&:country)
                       else []
                       end.flatten.compact.uniq
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
