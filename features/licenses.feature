@login
Feature: licenses

  Scenario Outline: add new license
    When I add month <month> and amount <amount>
    Then I can see the License with month <month> and amount <amount>
    Examples:
      | month       | amount |
      | "2017-04"   | "200"  |
      | "2017-03"   | "123"  |

  Scenario Outline: add existed license
    Given I have license month <month> and amount <amount>
    When I add month <month> and amount <newAmount>
    Then I can see the License with month <month> and amount <newAmount>
    Examples:
      | month       | amount | newAmount  |
      | "2017-04"   | "200"  |  "100"     |
      | "2017-03"   | "233"  |  "133"     |

  Scenario Outline: normal cases
    Given I have Licenses
      | month       | amount |
      | "2017-02"   | "28"   |
      | "2017-04"   | "30"   |
      | "2017-05"   | "31"   |
    When I query with start month <start_month> to end month <end_month>
    Then I can see the amount <expected_amount>
    Examples:
      | start_month    | end_month      | expected_amount |
      |  "2017-02-10"  |  "2017-02-14"  |  "5"            |
      |  "2017-04-14"  |  "2017-05-31"  |  "48"           |
      |  "2017-02-16"  |  "2017-04-30"  |  "43"           |

  Scenario Outline: Invalid time format
    When I query with start month <start_month> to end month <end_month>
    Then I can see the error dialog
    Examples:
      | start_month    | end_month      |
      |  "2017-04-30"  |  "2017-02-15"  |
      |  "2017-04-33"  |  "2017-05-15"  |

  Scenario Outline: No insertion
    When I query with start month <start_month> to end month <end_month>
    Then I can see the error dialog
    Examples:
      | start_month    | end_month      |
      |  ""            |  "2017-02-15"  |
      |  "2017-04-30"  |  ""            |
      |  ""            |  ""            |

  Scenario: set amount equal 0
    When I add month "2017-4" and amount "0"
    Then I can see the error dialog
