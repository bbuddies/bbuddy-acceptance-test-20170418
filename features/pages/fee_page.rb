require_relative 'page_base'

class FeePage < PageBase

  def marked
    'charge'
  end

  def enter_date(startDate, endDate)
    clear_then_enter_text("startDate", startDate)
    clear_then_enter_text("endDate", endDate)
    touch(marked)
  end

end