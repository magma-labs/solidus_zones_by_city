# frozen_string_literal: true

require 'solidus_zones_by_city'

module SolidusZonesByCity
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_zones_by_city'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
