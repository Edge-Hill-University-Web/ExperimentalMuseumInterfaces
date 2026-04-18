Feature: Site navigation
  As a visitor
  I want clear and consistent navigation
  So that I can move between sections without confusion

  Background:
    Given I am on the home page

  Scenario: Top-level nav items are all present
    Then I should see a navigation link labelled "About"
    And I should see a navigation link labelled "Research"
    And I should see a navigation link labelled "Experiments"
    And I should see a navigation link labelled "Writing"
    And I should see a navigation link labelled "Collaborate"

  Scenario: Clicking About navigates to the About page
    When I click the "About" navigation link
    Then I should be on the "/about" page

  Scenario: Clicking Research navigates to the Research page
    When I click the "Research" navigation link
    Then I should be on the "/research" page

  Scenario: Clicking Experiments navigates to the Experiments page
    When I click the "Experiments" navigation link
    Then I should be on the "/experiments" page

  Scenario: Clicking Writing navigates to the Writing page
    When I click the "Writing" navigation link
    Then I should be on the "/writing" page

  Scenario: Clicking Collaborate navigates to the Collaborate page
    When I click the "Collaborate" navigation link
    Then I should be on the "/collaborate" page

  Scenario: Active section is highlighted in the navigation
    Given I am on the "/about" page
    Then the "About" navigation link should be marked as the current page

  Scenario: Skip to main content link is present and functional
    Given I am on the home page
    Then I should see a skip link targeting the main content region
    And the skip link should be the first focusable element on the page
