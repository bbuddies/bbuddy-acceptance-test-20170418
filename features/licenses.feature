@login
Feature: Licenses

  Scenario: add new licenses
    When I add month "2017-04" and amount "200"
    Then I should see the license as below
      | month   | amount |
      | 2017-04 | 200    |

  Scenario: add an existing month license
    Given existing the following licenses
      | month   | amount |
      | 2017-04 | 200    |
    When I add month "2017-04" and amount "2000"
    Then I should see the license as below
      | month   | amount |
      | 2017-04 | 2000   |

  Scenario: verify error handling
    When I add month "2017-04" and amount "0"
    Then I should see error message "License amount should be greater than zero!"

  Scenario: Verify total license fee in multiple months
    Given existing the following licenses
      | month | amount |
      | 2017-03 | 200  |
      | 2017-06 | 600  |
    When I calculate license fee from "2017-03-13" to "2017-06-15"
    Then I should see total license fee is "422.58"