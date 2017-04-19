Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
  )
end

module Bbuddy module AcceptanceTest
  module Drivers

    def clear_then_enter_text(marked, text)
      fill_in marked, with: text
    end

    def touch(query, options={})
      click_on query
    end

    def wait_for_text_does_not_exist(text)
      page.assert_no_text(text)
    end

    def wait_for_element_exists(query, options={})
      page.assert_selector("input[value='#{query}']", visible: true)
    end

    def wait_for_element_does_not_exist(query, options={})
      page.assert_no_selector("input[value='#{query}']", visible: true)
    end

    def wait_for_text_and_then_touch(text)
      click_on text
    end

    def enter_text(query, text)
      fill_in query, with: text
    end

    def wait_for_text(text)
      page.assert_text(text)
    end

    def get_text_from_element(query)
      page.find(:xpath, ".//*[@id='#{query}']").text
    end

    def visit(url)
      super(url)
    end

  end
end end

Bbuddy::AcceptanceTest::Drivers.module_eval {
  include Capybara::DSL
}
