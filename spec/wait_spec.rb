require 'spec_helper'

describe SparklingWatir::Element do
  describe '#wait_until' do
    it 'returns element for additional actions' do
      title = @app.element(accessibility_id: 'Choose An Awesome View')
      expect(title.wait_until(&:exists?)).to eq title
    end
  end

  describe '#wait_while' do
    it 'returns element for additional actions' do
      title = @app.element(id: 'Choose An Awesome View')
      menu_option = @app.element(accessibility_id: 'Echo Box').wait_until(&:present?)
      menu_option.tap
      expect(title.wait_while(&:exists?)).to be_nil
    end
  end
end
