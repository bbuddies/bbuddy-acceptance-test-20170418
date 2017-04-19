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
  sleep 3
  actual = License.all.first
  expect(actual.month).to eq(table.hashes[0][:month])
end