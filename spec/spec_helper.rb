require 'rspec'
require 'yaml'
require_relative '../lib/sparkling_watir'
require_relative '../lib/sparkling_watir/element'

class SpecHelper
  RSpec.configure do |config|
    config.before(:example) do
      caps = YAML.load_file('./spec/config/caps.yml')
      platform = caps['default_platform']
      opts = caps[platform]

      @app = SparklingWatir::App.new(caps: opts)
    end

    config.after(:example) do
      @app.close
    end
  end
end
