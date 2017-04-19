require_relative 'page_base'

class LicensesPage < PageBase

  def marked
    'Licenses'
  end

  def go_to_add_license
    touch('Add')
    AddLicensePage.open
  end

  def go_to_query_amount
    touch('Query')
    QueryAmountPage.open
  end

end
