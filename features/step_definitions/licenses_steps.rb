When(/^I add month "([^\"]*)" and amount "([^\"]*)"$/) do |month, amount|
  wait_for_text "Dashboard"

  touch "Licenses"
  wait_for_text "Licenses"
  touch 'Add'

  enter_text('month',month)
  enter_text('amount',amount)

  touch "Save"
end


Then(/^I can see the license as blew$/) do |table|
  sleep 5
  actual = License.all.first
  expect(actual.month).to eq(table.hashes[0][:month])
end

Then(/^I can see "([^\"]*)"$/) do |text|
  wait_for_text "yy"
  sleep 5
end