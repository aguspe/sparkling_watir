require 'rspec'
require_relative '../lib/sparkling_watir'

class SparklingWatirSpec
  RSpec.describe do
    it 'opens Native/Hybrid App Locally' do
      opts = { url: 'http://localhost:4723/wd/hub',
               platformName: 'iOS',
               platformVersion: '15.5',
               deviceName: 'iPhone 8',
               app: 'TheApp.app' }

      app = SparklingWatir::App.new(caps: opts)
      expect(app.driver).to be_a(Appium::Core::Base::Driver)
      app.quit
    end
  end
end
