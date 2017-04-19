require_relative 'page_base'

class AddLicensePage < PageBase
  def marked
    'Save'
  end

  def add_license(month, amount)
    clear_then_enter_text("month",month)
    clear_then_enter_text("amount",amount)
    touch(marked)
  end

end