require_relative 'page_base'

class AddLicensePage < PageBase

  def marked
    'Licenses'
  end

  def add_license(month, amount)
    touch ('Licenses')
    wait_for_element_exists('Save')
    enter_text 'month', month
    enter_text 'amount', amount
    touch ('Save')
  end

end
