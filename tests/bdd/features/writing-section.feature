Feature: Writing section
  As a researcher or reader
  I want to browse publications and blog posts from the EMI team
  So that I can follow the research outputs and commentary

  Background:
    Given I am on the "/writing" page

  Scenario: Writing page shows Publications and Blog tabs
    Then I should see a link or tab labelled "Publications"
    And I should see a link or tab labelled "Blog"

  Scenario: Publications page lists publications in descending date order
    Given I am on the "/writing/publications" page
    Then I should see at least one publication entry
    And publications should be ordered newest first

  Scenario: Each publication entry has a stable citation URL
    Given I am on the "/writing/publications" page
    Then each publication should have a unique permalink

  Scenario: Blog page lists blog posts in descending date order
    Given I am on the "/writing/blog" page
    Then I should see at least one blog post entry
    And posts should be ordered newest first

  Scenario: Blog posts have a stable permalink
    Given I am on the "/writing/blog" page
    Then each blog post should have a unique permalink

  Scenario: Writing section passes accessibility check
    Then the page should have no axe violations at severity serious or above
