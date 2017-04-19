@login
Feature: licenses

  Scenario Outline: add new license
    When I add month <month> and amount <amount>
    Then I can see the license with month <month> and amount <amount>
    Examples:
      | month       | amount |
      | "2017-04"   | "200"  |

  Scenario Outline: add existed license
    Given I have license month <month> and amount <amount>
    When I add month <month> and amount <newAmount>
    Then I can see the license with month <month> and amount <newAmount>
    Examples:
      | month       | amount | newAmount  |
      | "2017-04"   | "200"  |  "100"     |