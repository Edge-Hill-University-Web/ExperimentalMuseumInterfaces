Feature: Home page
  As a visitor to the EMI site
  I want to see a clear overview of the project on the home page
  So that I understand what EMI is and where to go next

  Background:
    Given I am on the home page

  Scenario: Home page loads with a positioning statement
    Then the page should have a heading "Experimental Museum Interfaces"
    And I should see a positioning statement describing the research group

  Scenario: Featured experiments strip is visible
    Then I should see a section labelled "Experiments"
    And it should contain at least one experiment card pulled from the CMS

  Scenario: Recent writing list is visible
    Then I should see a section labelled "Writing"
    And it should list at least one recent publication or essay

  Scenario: Collaborate call to action is present
    Then I should see a link or button directing visitors to the Collaborate page

  Scenario: Home page passes basic accessibility check
    Then the page should have no axe violations at severity serious or above

  Scenario: Home page has correct SEO metadata
    Then the page title should contain "Experimental Museum Interfaces"
    And the page should have a meta description
    And the page should have a canonical URL
