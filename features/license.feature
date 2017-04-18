Feature: License

@login
Scenario: Successful add license
  When I add month "2017-04" and amount "200"
  Then I should see the license

# Scenario: Login Failed

