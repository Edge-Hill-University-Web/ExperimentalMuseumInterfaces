Feature: SEO metadata
  As a search engine or social media platform
  I want each page to have complete and accurate metadata
  So that the site is discoverable and previews correctly when shared

  Scenario Outline: Each public page has a unique title
    Given I am on the "<path>" page
    Then the page should have a non-empty title tag
    And the title should include "EMI" or "Experimental Museum Interfaces"
    Examples:
      | path                             |
      | /                                |
      | /about                           |
      | /research                        |
      | /experiments                     |
      | /writing                         |
      | /collaborate                     |

  Scenario Outline: Each public page has a meta description
    Given I am on the "<path>" page
    Then the page should have a non-empty meta description
    Examples:
      | path             |
      | /                |
      | /about           |
      | /research        |
      | /experiments     |
      | /writing         |
      | /collaborate     |

  Scenario: Every page has a canonical URL
    Given I am on the home page
    Then the page should have a canonical link element pointing to its own URL

  Scenario: OpenGraph tags are present on the home page
    Given I am on the home page
    Then the page should have og:title, og:description, and og:url meta tags

  Scenario: sitemap.xml exists and is valid XML
    When I request "/sitemap.xml"
    Then the response status should be 200
    And the content type should be "application/xml"
    And the XML should list all public routes

  Scenario: robots.txt exists and allows crawling
    When I request "/robots.txt"
    Then the response status should be 200
    And the file should not disallow all crawlers
