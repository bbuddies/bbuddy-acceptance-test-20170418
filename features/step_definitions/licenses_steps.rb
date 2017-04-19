When(/^I add month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  wait_for_text("Dashboard")
  touch "License"
  touch "Add"

  enter_text("month",month)
  enter_text("amount",amount)
  touch "Save"
end

Then(/^I should see the license$/) do |table|
  sleep 5
  actual = License.all.first
  expect(actual.month).to eq(table.hashes[0][:month])
  expect(actual.amount.to_s).to eq(table.hashes[0][:amount])
end


Given(/^I see the data in db$/) do

end

When(/^I update the data month to "([^"]*)" and amount "([^"]*)"$/) do |arg1, arg2|

end

Then(/^I should see data as below$/) do |table|
end

When(/^I input "([^"]*)"$/) do |arg1|

end

Then(/^I should see error message$/) do

end