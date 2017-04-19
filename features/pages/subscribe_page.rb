require_relative 'page_base'

class SubscribePage < PageBase

  def marked
    'Subscribe'
  end

  def type_start_date(start_date)
    enter_text('start_date_textfield', start_date)
  end

  def type_end_date(end_date)
    enter_text('end_date_textfield', end_date)
  end

  def tap_calculate_button
    touch('calculate_button')
  end

  def get_total_amount
    get_text_from_element('total_amount_label')
  end

  def verify_total_amount(expected_amount, actual_amount)
    puts "Expected Amount:", expected_amount, "Actual Amount:", actual_amount
    raise expected_amount.eql? actual_amount
  end

end
