require_relative 'page_base'

class SubscribePage < PageBase

  def marked
    'Subscribe'
  end

  def type_start_date(start_date)
    wait_for_element_and_enter_text('start_date_textfield', start_date)
  end

  def type_end_date(end_date)
    wait_for_element_and_enter_text('end_date_textfield', end_date)
  end

  def tap_calculate_button
    touch_when_element_exist('calculate_button')
  end

  def verify_total_amount(expected_amount, actual_amount)
    raise expected_amount.eql? actual_amount
  end

end
