require_relative 'page_base'

class DashboardPage < PageBase

  def marked
    'Dashboard'
  end

  def go_to_accounts
    touch('Accounts')
  end

  def go_to_budgets
    touch('Budgets')
  end

  def go_to_licenses
    touch('License')
  end

  def go_to_fee
    touch('Fee')
  end

end
