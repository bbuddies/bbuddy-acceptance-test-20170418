When(/^I add month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
 touch ('Licenses')
 touch ('add_license_button')
 wait_for_text "Save"
 clear_then_enter_text('month_textfield', month)
 clear_then_enter_text('amount_textfield', amount)
 touch ('save_button')
end

Then(/^I should see the license$/) do
  pending # Write code here that turns the phrase above into concrete actions
end