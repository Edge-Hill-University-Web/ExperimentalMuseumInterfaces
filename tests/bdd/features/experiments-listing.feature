Feature: Experiments catalogue
  As a visitor
  I want to browse the EMI experiments
  So that I can discover and explore the research interfaces

  Background:
    Given I am on the "/experiments" page

  Scenario: Experiments page shows the two main threads
    Then I should see a link or section for "Voice"
    And I should see a link or section for "Legacy"

  Scenario: Voice thread is labelled as a specialised thread
    Then I should see "Voice" described as a specialised research thread

  Scenario: Legacy thread is labelled as reconstructions
    Then I should see "Legacy" described as interface reconstructions

  Scenario: Draft experiments are hidden from anonymous visitors
    Then I should not see any experiment card marked "Draft"

  Scenario: Experiments page passes accessibility check
    Then the page should have no axe violations at severity serious or above
