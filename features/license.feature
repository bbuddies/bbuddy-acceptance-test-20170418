@login
Feature: License

Scenario: Successful add license
  When I add month "2017-04" and amount "200"
  Then I should see the license
    | month | amount |
    | 2017-04 | 200 |

  Scenario: Successful update license
    Given exist license
      | month | amount |
      | 2017-04 | 200 |
    When I add month "2017-04" and amount "100"
    Then I should see the license
      | month | amount |
      | 2017-04 | 100 |

  Scenario: Verify error message
    When I add license
      | month | amount |
      | 2017-04 | -1 |
      | 2017-04 | 0 |
    Then I should see error message "system error, please find PO"


