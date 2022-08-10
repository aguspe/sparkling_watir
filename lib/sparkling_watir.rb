require 'watir'

module SparklingWatir
    #
    # For driving a native application or a native app context
    #
    class App
      attr_accessor :driver

      def initialize(opts)
        url = opts[:caps].delete(:url)
        @driver = Appium::Core::Driver.for(opts).start_driver(server_url: url)
      end

      def quit
        @driver.quit
      end
      alias close quit

      def element(selector)
        Element.new(driver, selector)
      end

      def method_missing(method_name, *arguments, &block)
        if driver.respond_to? method_name
          driver.send method_name, *arguments, &block
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        driver.respond_to?(method_name) || super
      end
    end
end
