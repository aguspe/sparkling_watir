# frozen_string_literal: true

require 'appium_lib_core/common/touch_action/touch_actions'
require 'selenium/webdriver/common/interactions/interactions'

module SparklingWatir
  # This module handles all the possible gestures
  module Gestures
    VIEWPORT = ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT

    def action(kind, name)
      @driver.action.add_pointer_input(kind, name)
    end

    def perform(*actions)
      @driver.perform_actions actions
    end

    def tap(timeout = nil)
      wait_until(timeout: timeout, &:present?)
      tap = action(:touch, 'tap')
      tap.create_pointer_move(duration: 0.1, x: coordinates[:x], y: coordinates[:y], origin: VIEWPORT)
      tap.create_pointer_down(:left)
      tap.create_pointer_up(:left)
      perform tap
    end

    alias press tap

    def double_tap
      wait_until(&:present?)
      double_tap = action(:touch, 'double_tap')
      tap.create_pointer_move(duration: 0.1, x: coordinates[:x], y: coordinates[:y], origin: VIEWPORT)
      double_tap.create_pointer_down(:left)
      double_tap.create_pointer_up(:left)
      double_tap.create_pause(0.5)
      double_tap.create_pointer_down(:left)
      double_tap.create_pointer_up(:left)

      perform double_tap
    end

    def swipe(direction, element, end_coordinates = nil)
      wait_until(&:present?)
      element.wait_until(&:exists?)
      start_coordinates = coordinates
      end_coordinates ||= element.coordinates
      choose_direction(direction, start_coordinates, end_coordinates)
    end

    alias swipe_to swipe

    private

    def choose_direction(direction, start_coordinates, end_coordinates)
      case direction
      when :down then swipe_down(start_coordinates, end_coordinates)
      when :right then swipe_right(start_coordinates, end_coordinates)
      when :up then swipe_up(start_coordinates, end_coordinates)
      else
        raise 'You have selected a wrong direction. Please choose between: left, right, up or down'
      end
    end

    def swipe_down(start_coordinates, end_coordinates)
      finger = action(:touch, 'swipe')
      finger.create_pointer_move(duration: 1, x: start_coordinates[:x], y: start_coordinates[:y], origin: VIEWPORT)
      finger.create_pointer_down(:left)
      finger.create_pointer_move(duration: 1, x: end_coordinates[:x], y: - end_coordinates[:y], origin: VIEWPORT)
      finger.create_pointer_up(:left)
      perform finger
    end

    def swipe_up(start_coordinates, end_coordinates)
      finger = action(:touch, 'swipe')
      finger.create_pointer_move(duration: 1, x: start_coordinates[:x], y: start_coordinates[:y], origin: VIEWPORT)
      finger.create_pointer_down(:left)
      finger.create_pointer_move(duration: 1, x: end_coordinates[:x], y: -5 * end_coordinates[:y], origin: VIEWPORT)
      finger.create_pointer_up(:left)
      perform finger
    end

    def swipe_right(start_coordinates, end_coordinates)
      finger = action(:touch, 'swipe')
      finger.create_pointer_move(duration: 1, x: start_coordinates[:x], y: start_coordinates[:y], origin: VIEWPORT)
      finger.create_pointer_down(:left)
      finger.create_pointer_move(duration: 1, x: - end_coordinates[:x], y: end_coordinates[:y], origin: VIEWPORT)
      finger.create_pointer_up(:left)
      perform finger
    end
  end
end
