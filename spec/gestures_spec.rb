# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/sparkling_watir/gestures'

describe 'Gestures' do
  let(:app) { @app }

  it '#tap' do
    backpack = app.element(accessibility_id: 'Sauce Labs Backpack')
    backpack.tap
    title = app.element(accessibility_id: 'Add To Cart button').wait_until(&:present?)
    expect(title).to be_present
  end

  it '#double_tap' do
    menu_option = app.element(accessibility_id: 'tab bar option menu')
    menu_option.double_tap
    title = app.element(accessibility_id: 'API calls')
    expect(title.wait_until(&:present?)).to be_present
  end

  it '#swipe_down' do
    backpack = app.element(accessibility_id: 'Sauce Labs Backpack')
    backpack.tap
    element = app.element(accessibility_id: 'Sauce Labs Bolt T-Shirt')
    backpack.swipe_to(:down, element)
    backpack.tap
  end

  it '#swipe_right' do
    app.element(accessibility_id: 'tab bar option menu').tap
    drawing = app.element(accessibility_id: 'menu item drawing')
    scroll_bar = app.element(accessibility_id: 'Vertical scroll bar, 2 pages')
    drawing.swipe_to(:right, scroll_bar)
    drawing.tap
  end
end
