Given(/^existing the following licenses$/) do |table|
  License.create( table.hashes.first)
end

When(/^I add month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  DashboardPage.open.go_to_licenses
  LicensesPage.open.go_to_add_license.add_license(month, amount)
end

When(/^I calculate license fee from "([^"]*)" to "([^"]*)"$/) do |startDate, endDate|
  DashboardPage.open.go_to_fee
  FeePage.open.enter_date(startDate, endDate)
end

Then(/^I should see the license as below$/) do |table|
  sleep 5
  actual = License.first
  expect(actual.month).to eq(table.hashes[0][:month])
  expect(actual.amount.to_s).to eq(table.hashes[0][:amount])
end

Then(/^I should see error message "License amount should be greater than zero!"$/) do
  wait_for_text("License amount should be greater than zero!")
end

Then(/^I should see total license fee is "([^"]*)"$/) do |licenseFee|
  wait_for_text("#{licenseFee}")
end
