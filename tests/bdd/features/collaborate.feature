Feature: Collaborate and participate
  As a potential partner, institution, or research participant
  I want to find out how to get involved with EMI
  So that I can collaborate or participate in experiments

  Background:
    Given I am on the "/collaborate" page

  Scenario: Collaborate page renders with a clear invitation
    Then the page should have a heading containing "Collaborate"
    And I should see a description of how to get involved

  Scenario: Collaborate page links to the live voice grid experiment
    Then I should see a link to the live voice grid research experiment

  Scenario: Collaborate page includes a contact form or contact route
    Then I should see a way to get in touch with the EMI team

  Scenario: Collaborate page passes accessibility check
    Then the page should have no axe violations at severity serious or above
