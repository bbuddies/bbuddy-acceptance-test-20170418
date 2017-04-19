@login
Feature: licenses

  Scenario Outline: add new license
    When I add month <month> and amount <amount>
    Then I can see the license with month <month> and amount <amount>
    Examples:
      | month       | amount |
      | "2017-04"   | "200"  |
      | "2017-03"   | "123"  |

  Scenario Outline: add existed license
    Given I have license month <month> and amount <amount>
    When I add month <month> and amount <newAmount>
    Then I can see the license with month <month> and amount <newAmount>
    Examples:
      | month       | amount | newAmount  |
      | "2017-04"   | "200"  |  "100"     |
      | "2017-03"   | "233"  |  "133"     |

  Scenario: add new licenses
    When I add month "2017-04" and amount "200"
    Then I can see the license as blew
      | month    | amount |
      | 2017-04  | 200    |

  Scenario: change the licenses
    Given I have license month "2017-04" and amount "200"
    When I add month "2017-04" and amount "500"
    Then I can see the license as blew
      | month    | amount |
      | 2017-04  | 500    |


  Scenario: set amount equal 0
    When I add month "2017-4" and amount "0"
    Then I can see "yy"
