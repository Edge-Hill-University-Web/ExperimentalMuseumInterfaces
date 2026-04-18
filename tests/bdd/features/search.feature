Feature: Site search
  As a visitor
  I want to search across the EMI site
  So that I can quickly find a specific experiment, publication, or research thread

  Scenario: Search returns results from Experiments
    Given the CMS has a published Experiment titled "Voice Grid Demo"
    When I search for "Voice Grid"
    Then I should see "Voice Grid Demo" in the search results

  Scenario: Search returns results from Publications
    Given the CMS has a publication titled "Generous Browsing Interfaces"
    When I search for "Generous Browsing"
    Then I should see "Generous Browsing Interfaces" in the search results

  Scenario: Search returns results from Research threads
    Given the CMS has a research thread titled "AI-supported Exploration"
    When I search for "AI exploration"
    Then I should see the AI-supported Exploration thread in the results

  Scenario: Search for a term with no matches shows an empty state
    When I search for "xkcd-no-match-term-xyz"
    Then I should see a message indicating no results were found

  Scenario: Search results are ordered by relevance and recency
    Given the CMS has multiple items matching "voice"
    When I search for "voice"
    Then the most recently published matching item should appear first
