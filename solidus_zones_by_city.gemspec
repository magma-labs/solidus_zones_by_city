# frozen_string_literal: true

require_relative 'lib/solidus_zones_by_city/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_zones_by_city'
  spec.version = SolidusZonesByCity::VERSION
  spec.authors = ['César Carruitero']
  spec.email = 'ccarruitero@protonmail.com'

  spec.summary = 'Allow zones at city level'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/magma-labs/solidus_zones_by_city'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/magma-labs/solidus_zones_by_city'
  spec.metadata['changelog_uri'] = 'https://github.com/magma-labs/solidus_zones_by_city/releases'

  spec.required_ruby_version = Gem::Requirement.new('~> 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 3']
  spec.add_dependency 'solidus_support', '~> 0.5'

  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'solidus_dev_support'
end
