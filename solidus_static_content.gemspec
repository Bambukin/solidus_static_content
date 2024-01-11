# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_static_content/version'

Gem::Specification.new do |s|
  s.name = 'solidus_static_content'
  s.version = SolidusStaticContent::VERSION
  s.authors = ['Peter Berkenbosch', 'Roman Smirnov', 'Jonathan Tapia']
  s.email = 'peter@pero-ict.nl'

  s.summary = 'Extension to manage the static pages for your Solidus store.'
  s.description = 'Manage the static pages of your Solidus store or replace existing pages with a static version'
  s.homepage = 'https://github.com/solidusio-contrib/solidus_static_content#readme'
  s.license = 'BSD-3-Clause'

  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = 'https://github.com/solidusio-contrib/solidus_static_content#readme'
  s.metadata['changelog_uri'] = 'https://github.com/solidusio-contrib/solidus_static_content/releases'

  s.required_ruby_version = Gem::Requirement.new('>= 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  s.files = files.grep_v(%r{^(test|spec|features)/})
  s.test_files = files.grep(%r{^(test|spec|features)/})
  s.bindir = 'exe'
  s.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  solidus_version = ['>= 3.2', '< 5']

  s.add_dependency 'deface'
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support', '~> 0.5'

  s.add_development_dependency 'cuprite'
  s.add_development_dependency 'solidus_dev_support'
end
