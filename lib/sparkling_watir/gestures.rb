require 'appium_lib_core/common/touch_action/touch_actions'
require 'selenium/webdriver/common/interactions/interactions'

module SparklingWatir
  module Gestures

    VIEWPORT = ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT

    def action(kind, name)
      @driver.action.add_pointer_input(kind, name)
    end

    def perform(*actions)
      @driver.perform_actions actions
    end

    def tap
      tap = action(:touch, 'tap')
      tap.create_pointer_move(duration: 0.1, x: bounds[:x], y: bounds[:y] - 1, origin: VIEWPORT)
      tap.create_pointer_down(:left)
      tap.create_pointer_up(:left)
      perform tap
    end

    alias press tap

    def double_tap
      double_tap = action(:touch, 'double_tap')
      double_tap.create_pointer_move(duration: 0.1, x: bounds[:x], y: bounds[:y] - 1, origin: VIEWPORT)
      double_tap.create_pointer_down(:left)
      double_tap.create_pointer_up(:left)
      double_tap.create_pause(0.5)
      double_tap.create_pointer_down(:left)
      double_tap.create_pointer_up(:left)

      perform double_tap
    end
  end
end
