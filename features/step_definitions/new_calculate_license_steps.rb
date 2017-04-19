Given(/^licenses period$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  # pending # Write code here that turns the phrase above into concrete actions
  licences = AddLicensePage.open
  licences.add_license(table.hashes[0][:month], table.hashes[0][:amount])
end

When(/^I set license period from "([^"]*)" to "([^"]*)"$/) do |start_date, end_date|
  puts start_date
  puts end_date
  wait_for_text_and_then_touch('Subscribe')
  subscribe = SubscribePage.open
  subscribe.type_start_date(start_date)
  subscribe.type_end_date(end_date)
  subscribe.tap_calculate_button
end