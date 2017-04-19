Given(/^I have license month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  License.create(month: month, amount: amount)
  sleep(1)
end

When(/^I add month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  wait_for_text "dashboard"

  touch "Licenses"
  wait_for_text "Licenses"
  touch 'Add'

  enter_text('month',month)
  enter_text('amount',amount)

  touch "Save"
end


Then(/^I can see the license with month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  sleep(5)
  license_on_db = License.all.first
  raise "Data not found" if license_on_db.nil?
  if license_on_db.month != month or license_on_db.amount.to_s != amount
    raise 'Test failed'
  end
end