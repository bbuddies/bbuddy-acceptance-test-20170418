@login
Feature: licenses

  Scenario: add new licenses
    When I add month "2017-04" and amount "200"
    Then I can see the license as blew
      | month    | amount |
      | 2017-04  | 200    |

  Scenario: change the licenses
    Given I have month "2017-04" and amount "200" licenses
    When I add month "2017-04" and amount "500"
    Then I can see the license as blew
      | month    | amount |
      | 2017-04  | 500    |


  Scenario: add 0 licenses
    When I add month "2017-4" and amount "0"
    Then I can see "yy"
