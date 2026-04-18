Feature: About page
  As a visitor
  I want to learn about the EMI research group
  So that I understand who is behind the work and what drives it

  Background:
    Given I am on the "/about" page

  Scenario: About page renders the group statement
    Then I should see a group statement describing the EMI research mission

  Scenario: About page lists named leads
    Then I should see the name "David Walsh"
    And I should see the name "Daniel Campbell"

  Scenario: About page includes institutional link to Edge Hill University
    Then I should see a link to "edgehill.ac.uk"

  Scenario: About page includes scope statement and research values
    Then I should see a section describing the research scope
    And I should see a section describing research values

  Scenario: About page passes accessibility check
    Then the page should have no axe violations at severity serious or above
