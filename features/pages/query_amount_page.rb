require_relative 'page_base'

class QueryAmountPage < PageBase

  def marked
    'Get Amount'
  end

  def query_amount(start_date, end_date)
    clear_then_enter_text('start_date', start_date)
    clear_then_enter_text('end_date', end_date)
    touch(marked)
  end

end
