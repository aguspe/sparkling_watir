# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'sparkling_watir'
  spec.version       = '0.0.2'
  spec.authors       = ['Agustin Pequeno']
  spec.email         = ['agustin.pe94@gmail.com']

  spec.summary       = 'A watir adaptation for testing your native mobile apps'
  spec.description   = 'Sparkling watir takes heavy inspiration from tap watir and is a mobile adaptation of watir'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.7.0'

  spec.add_development_dependency 'bundler', '~> 2.3.17'
  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'rspec', '~> 3.11.0'
  spec.add_development_dependency 'rubocop', '~> 1.27'
  spec.add_development_dependency 'rubocop-performance', '~> 1.15.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.9.0'

  spec.add_dependency 'appium_lib_core', '~>5.3.0 '
  spec.add_dependency 'watir', '~> 7.1.0'
end
