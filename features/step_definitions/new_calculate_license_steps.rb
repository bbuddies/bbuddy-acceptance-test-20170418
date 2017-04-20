Given(/^licenses period$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  # pending # Write code here that turns the phrase above into concrete actions
  licences = AddLicensePage.open
  table.hashes.each do |row|
    licences.add_license(row[:month], row[:amount])
  end
end

When(/^I set license period from "([^"]*)" to "([^"]*)"$/) do |start_date, end_date|
  wait_for_text_and_then_touch('Subscribe')
  @subscribe = SubscribePage.open
  @subscribe.type_start_date(start_date)
  @subscribe.type_end_date(end_date)
  @subscribe.tap_calculate_button
end

Then(/^I should see total amount "([^"]*)"$/) do |total_amount|
  @subscribe.verify_total_amount(total_amount, @subscribe.get_total_amount)
end