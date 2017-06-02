Feature: UI test for shoppe
  Scenario: Login feature
    Given I open shoppe home page
    When I click login link
    Then should display login page
    When I input username and password
      And click login button
    Then I should login successfully
  Scenario: Shopping bag feature
    Given I open shoppe home page
    When I add Yealink T20P into bag
    And I add Yealink T46GN into bag
      And I open my bag
      Then I should see two items in my bag
      When I remove first item from my bag
      Then I should see only one items in my bag
      When I remove all items from my bage
      Then should jump back to home page