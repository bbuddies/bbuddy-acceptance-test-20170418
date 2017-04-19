Given(/^licenses period$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  # pending # Write code here that turns the phrase above into concrete actions
end

When(/^I set license period from "([^"]*)" to "([^"]*)"$/) do |start_date, end_date|
  puts start_date
  puts end_date
  # DashboardPage.go_to_subscribe
  DashboardPage.open
end