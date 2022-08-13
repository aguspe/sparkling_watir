# SparklingWatir

Watir for testing your Mobile Devices. Powered by Appium.
This project is a revamp of [Tap watir](https://github.com/watir/tap_watir).

All the inspiration from this project is taken from Tap Watir, so all the credit goes
to the original creators and contributors

If you don't know the watir project here is the [link to the project](http://watir.com/)

This project is still in an alpha stage and under active development.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sparkling_watir'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sparkling_watir

If you want to run the tests on iOS just create a simulator that is an iPhone 8 with os 15.5 or you can change 
the capabilities in spec/config/caps and you can download the testing app [here](https://github.com/cloudgrey-io/the-app/releases/tag/v1.10.0)

All the credit for the testing app goes to Jonathan Lipps.

If you want to switch between android and iOS capabilties just run:

    $ rake platform[android] or rake platform[ios]


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
