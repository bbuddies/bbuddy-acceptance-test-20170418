Transform /^table:month,amount/ do |table|
  table.hashes.map {|row| License.new(row) }
end

Transform /^License with month (\w+) and amount (\w+)$/ do |month, amount|
  License.new(month: month, amount: amount)
end
