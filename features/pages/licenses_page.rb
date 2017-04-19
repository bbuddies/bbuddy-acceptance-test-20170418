require_relative 'page_base'

class LicensesPage < PageBase
  def marked
    'License'
  end

  def go_to_add_license
    touch('Add')
    AddLicensePage.open
  end

end