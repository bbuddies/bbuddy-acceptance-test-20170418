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

  def go_to_subscribe
    touch('Subscribe')
  end

end
