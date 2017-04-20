module Bbuddy module AcceptanceTest
  module Drivers
    def clear_then_enter_text(marked, text)
      clear_text_in(marked_ui_query(marked))
      enter_text(marked, text)
    end

    def touch(query, options={})
      super(marked_ui_query(query), options)
    end

    def wait_for_text_does_not_exist(text)
      wait_for_element_does_not_exist("* {text CONTAINS[c] '#{text}'}")
    end

    def wait_for_element_exists(query, options={})
      super(marked_ui_query(query), options)
    end

    def wait_for_element_does_not_exist(query, options={})
      super(marked_ui_query(query), options)
    end

    def wait_for_text_and_then_touch(text)
      wait_for_text(text)
      touch(text)
    end

    def touch_when_element_exist(marked)
      wait_for_element_exists(marked)
      touch(marked)
    end

    def wait_for_element_and_enter_text(marked, text)
      wait_for_element_exists(marked)
      enter_text(marked, text)
    end

    def get_text_from_element(query)
      wait_for_element_exists(query)
      query("* marked:'#{query}'", :text).first
    end

    def marked_ui_query(query)
      if marked?(query)
        "* marked:'#{query}'"
      else
        query
      end
    end

    def marked?(str)
      str.match?(/^[a-z0-9_ ]+$/i)
    end

  end
end end
