require_relative 'spec_helper'

describe SparklingWatir::Gestures do
  it '#tap' do
    element = @app.element(accessibility_id: 'Echo Box').wait_until(&:present?)
    element.tap
    back_button = @app.element(class: 'Button').wait_until(&:present?)
    expect(back_button).to be_present
  end

  it '#double_tap' do
    element = @app.element(accessibility_id: 'Echo Box').wait_until(&:present?)
    element.tap
    @app.element(class: 'Button').wait_until(&:present?).double_tap
    title = @app.element(accessibility_id: 'Choose An Awesome View')
    expect(title.wait_until(&:present?)).to be_present
  end
end
