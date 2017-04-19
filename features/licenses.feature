@login
Feature: Licenses
  Scenario: add new licenses
    When I add month "2017-04" and amount "200"
    Then I should see the license
    | month | amount |
    | 2017-04 | 200 |

  Scenario: update licenses data
    Given I see the data in db
    When I update the data month to "2017-04" and amount "2000"
    Then I should see data as below
      | month | amount |
      | 2017-04| 2000 |

  Scenario: verify error handling
    When I input "0"
    Then I should see error message
