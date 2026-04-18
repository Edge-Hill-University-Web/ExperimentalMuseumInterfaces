Feature: Performance budgets
  As a site visitor on a slow connection
  I want pages to load quickly
  So that the site is usable regardless of network conditions

  Scenario Outline: Text-heavy pages meet LCP budget on Fast 3G
    Given I load the "<path>" page under simulated Fast 3G conditions
    Then the Largest Contentful Paint should be under 2500 milliseconds
    Examples:
      | path                                 |
      | /                                    |
      | /about                               |
      | /research                            |
      | /research/limitations-of-browsing    |
      | /writing/publications                |

  Scenario Outline: Text-only routes stay under 500KB total weight
    Given I load the "<path>" page
    Then the total page weight should be under 512000 bytes
    Examples:
      | path                           |
      | /                              |
      | /about                         |
      | /research                      |
      | /writing/publications          |

  Scenario: Live grid experiment page shows a lightweight preview before loading the full interface
    Given I load the "/experiments/voice/grid/live" page under simulated Fast 3G conditions
    Then a loading placeholder or preview should be visible before the interface is fully ready

  Scenario: Lighthouse performance score meets minimum threshold
    Given I run Lighthouse against the home page
    Then the performance score should be 80 or above

  Scenario: Lighthouse accessibility score meets minimum threshold
    Given I run Lighthouse against the home page
    Then the accessibility score should be 95 or above
