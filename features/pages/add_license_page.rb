require_relative 'page_base'

class AddLicensePage < PageBase

  def marked
    'Save'
  end

  def add_license(license)
    clear_then_enter_text('month', license.month)
    clear_then_enter_text('amount', license.amount)
    touch(marked)
  end

end
