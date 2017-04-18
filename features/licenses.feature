@login
Feature: Licenses
  Scenario: add new licenses
    When I add month "2017-04" and amount "200"
    Then I should see the license
    | month | amount |
    | 2017-04 | 200 |