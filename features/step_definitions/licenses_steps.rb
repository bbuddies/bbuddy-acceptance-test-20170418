When(/^I add month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  wait_for_text "dashboard"

  touch "Licenses"
  wait_for_text "Licenses"
  touch 'Add'

  enter_text('month',month)
  enter_text('amount',amount)

  touch "Save"
end


Then(/^I can see the license$/) do

end