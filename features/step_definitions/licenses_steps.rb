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
  DashboardPage.open.go_to_licenses
  LicensesPage.open.go_to_add_license.add_license(License.new(month: month, amount: amount))
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
  LicensesPage.open.assert_message_show("yy")
  sleep 5
end

When(/^I query with start month "([^\"]*)" to end month "([^\"]*)"$/) do |start_month, end_amount|
  LicensesPage.open.go_to_query_amount.query_amount(start_month, end_amount)
end

Then(/^I can see the amount "([^\"]*)"$/) do |amount|
  sleep 5
  AddLicensePage.open.assert_amount_show(amount)
end