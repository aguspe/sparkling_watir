# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/sparkling_watir/gestures'

describe 'Gestures' do
  let(:app) { @app }
  let(:backpack) { app.element(accessibility_id: 'Sauce Labs Backpack').wait_until(&:present?) }
  let(:element) { app.element(accessibility_id: 'Sauce Labs Bike Light').wait_until(&:present?) }

  it '#tap' do
    backpack.tap
    title = app.element(accessibility_id: 'Sauce Labs Backpack')
    expect(title).to be_present
  end

  it '#double_tap' do
    backpack.double_tap
    title = app.element(accessibility_id: 'API calls')
    expect(title.wait_until(&:present?)).to be_present
  end

  it '#swipe_down' do
    element = app.element(accessibility_id: 'Sauce Labs Bolt T-Shirt')
    backpack.swipe(:down, element)
    expect(app.element(predicate: 'label == "Products"')).not_to be_present
  end

  it '#swipe_up' do
    element = app.element(accessibility_id: 'Sauce Labs Bolt T-Shirt')
    title = app.element(xpath: '//XCUIElementTypeStaticText[@name="Products"]')
    backpack.swipe(:down, element)
    element.swipe(:up, title)
    expect(title).to be_present
  end

  it '#swipe_right' do
    backpack.swipe(:right, element)
    menu_item = app.element(accessibility_id: 'menu item webview')
    expect(menu_item).to be_present
  end

  it '#swipe_left' do
    app.element(accessibility_id: 'tab bar option menu').tap
    app.element(accessibility_id: 'menu item drawing').tap
    pad = app.element(xpath: '(//XCUIElementTypeOther[@name="Vertical scroll bar, 2 pages Horizontal scroll bar, 1 page"])[3]/XCUIElementTypeWebView')
    pad.swipe(:up, nil, 1, { end_coordinates: { x: 0, y: 50 } })
    pad.swipe(:down, nil, 1, { end_coordinates: { x: 0, y: 100 } })
    pad.swipe(:right, nil, 1, { end_coordinates: { x: - 20, y: 0 } })
    pad.swipe(:left, nil, 1, { end_coordinates: { x: 20, y: 0 } })
    #expect(menu_item).to be_present
  end
end
