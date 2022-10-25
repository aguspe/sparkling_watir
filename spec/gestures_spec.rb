# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/sparkling_watir/gestures'

describe 'Gestures' do
  let(:app) { @app }
  let(:backpack) { app.element(accessibility_id: 'Sauce Labs Backpack').wait_until(&:present?) }

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
    element.swipe_to(:up, title)
    expect(title).to be_present
  end

  it '#swipe_right' do
    backpack = app.element(accessibility_id: 'Sauce Labs Backpack')
    element = app.element(accessibility_id: 'Sauce Labs Bike Light')
    backpack.swipe(:right, element)
  end
end
