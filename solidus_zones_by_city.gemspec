# frozen_string_literal: true

require_relative 'lib/solidus_zones_by_city/version'

Gem::Specification.new do |s|
  s.name = 'solidus_zones_by_city'
  s.version = SolidusZonesByCity::VERSION
  s.authors = ['César Carruitero']
  s.email = 'ccarruitero@protonmail.com'

  s.summary = 'Allow zones at city level'
  s.description = s.summary
  s.homepage = 'http://github.com/magma-labs/solidus_zones_by_city'
  s.license = 'BSD-3-Clause'

  if s.respond_to?(:metadata)
    s.metadata['homepage_uri'] = s.homepage if s.homepage
    s.metadata['source_code_uri'] = s.homepage if s.homepage
  end

  s.required_ruby_version = Gem::Requirement.new('>= 2.5')

  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  s.files = files.grep_v(%r{^(test|spec|features)/})
  s.test_files = files.grep(%r{^(test|spec|features)/})
  s.bindir = "exe"
  s.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'solidus_backend', ['>= 2.5', '< 4']
  s.add_dependency 'solidus_core', ['>= 2.5', '< 4']
  s.add_dependency 'solidus_support', '~> 0.5'

  s.add_development_dependency 'autoprefixer-rails', '~> 10.2.5'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'solidus_dev_support', '~> 2.3'
end
