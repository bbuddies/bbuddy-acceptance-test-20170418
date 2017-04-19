require_relative 'page_base'

class AddLicensePage < PageBase

  def marked
    'Licenses'
  end

  def add_license(month, amount)
    touch ('Licenses')
    # touch ('add')
    wait_for_text "Save"
    wait_for_element_and_enter_text 'month_textfield', month
    wait_for_element_and_enter_text 'amount_textfield', amount
    touch ('save_button')
  end

end
