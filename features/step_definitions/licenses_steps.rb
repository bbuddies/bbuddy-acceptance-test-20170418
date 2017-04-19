Given(/^I have license month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  License.create(month: month, amount: amount)
  sleep(1)
end

Given(/^I have Licenses$/) do |licenses|
  licenses.each do |license|
    license.save!
    @current_account = license
  end
end

When(/^I add month "([^\"]*)" and amount "([^\"]*)"$/) do |month, amount|
  wait_for_text "Dashboard"

  touch "Licenses"
  wait_for_text "Licenses"
  touch 'Add'

  enter_text('month',month)
  enter_text('amount',amount)

  touch "Save"
end

Then(/^I can see the License with month "([^\"]*)" and amount "([^\"]*)"/) do |month, amount|
  sleep(5)
  license_on_db = License.all.first
  raise "Data not found" if license_on_db.nil?
  if license_on_db.month != month or license_on_db.amount.to_s != amount
    raise 'Test failed'
  end
end

Then(/^I can see the Licenses$/) do |licenses|
  sleep 5
  actual = License.all.first
  expect(actual.month).to eq(licenses.first.month)
  expect(actual.amount).to eq(licenses.first.amount)
end

Then(/^I can see the error dialog$/) do
  wait_for_text "yy"
  sleep 5
end

When(/^I query with start month "([^\"]*)" to end month "([^\"]*)"$/) do |start_month, end_amount|
  wait_for_text "Dashboard"

  touch "Licenses"
  wait_for_text "Licenses"

  touch "Query" # id= query

  # wait_for_text "Licenses"
  # touch 'Add'

  enter_text('start_date',start_month)
  enter_text('end_date',end_amount)

  touch "Get Amount" #id = get_amount
end

Then(/^I can see the amount "([^\"]*)"$/) do |text|
  sleep 5
  wait_for_text text
end