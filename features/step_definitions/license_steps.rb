When(/^I add month "([^"]*)" and amount "([^"]*)"$/) do |month, amount|
  wait_for_text_and_then_touch ('Licenses')
  touch ('add_license_button')
  wait_for_text "Save"
  enter_text 'month_textfield', month
  enter_text 'amount_textfield', amount
  touch ('save_button')
end

Then(/^I should see the license$/) do |table|
  sleep 10
  actual = License.all.first
  # expect(actual.month).to eq()
  expect(actual.month).to eq(table.hashes[0][:month])
end