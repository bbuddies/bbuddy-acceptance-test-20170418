@login
Feature: New License cal

  Scenario: Verify one month license period
    Given licenses period
      | month | amount |
      | 2017-01 | 200  |
    When I set license period from "2017-01-03" to "2017-01-30"
    Then I should see total amount "180.65"

  Scenario: Verify cross month license period
    Given licenses period
      | month | amount |
      | 2017-01 | 200  |
      | 2017-06 | 500  |
    When I set license period from "2017-01-03" to "2017-05-30"
    Then I should see total amount "187.10"

  Scenario: Verify error month license period(1)
    Given licenses period
      | month | amount |
      | 2017-01 | 200  |
      | 2017-06 | 500  |
    When I set license period from "2017-05-03" to "2017-01-30"
    Then I should see error message "system error"


  Scenario: Verify out of month license period
    Given licenses period
      | month | amount |
      | 2017-01 | 200  |
      | 2017-06 | 500  |
    When I set license period from "2016-12-01" to "2017-07-30"
    Then I should see total amount "700"


