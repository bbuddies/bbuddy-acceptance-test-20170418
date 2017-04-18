When(/^I add month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  wait_for_text("Dashboard")
  touch "License"
  touch "Add"

  enter_text("month",month)
  enter_text("amount",amount)
  touch "Save"
end

Then(/^I should see the license$/) do |table|

end