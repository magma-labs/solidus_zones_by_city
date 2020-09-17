# frozen_string_literal: true

module SolidusZonesByCity
  module Controllers
    module Admin
      module ZonesController
        private

        def load_data
          @cities = Spree::City.order(:name)
          super
        end
      end
    end
  end
end

Spree::Admin::ZonesController.prepend(SolidusZonesByCity::Controllers::Admin::ZonesController)
