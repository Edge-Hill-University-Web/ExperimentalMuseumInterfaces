Feature: Accessibility
  As a user with access needs
  I want every public page to meet WCAG 2.2 AA
  So that I can use the site regardless of how I interact with it

  Scenario Outline: Each public route has no critical axe violations
    Given I am on the "<path>" page
    Then the page should have no axe violations at severity serious or above
    Examples:
      | path                                       |
      | /                                          |
      | /about                                     |
      | /research                                  |
      | /research/dch-users                        |
      | /research/dch-users/casual-users           |
      | /research/generous-and-rich-prospect       |
      | /research/ai-supported-exploration         |
      | /research/evaluation-and-user-categories   |
      | /research/limitations-of-browsing          |
      | /experiments                               |
      | /experiments/voice                         |
      | /experiments/voice/overview                |
      | /experiments/voice/grid                    |
      | /experiments/voice/driven-browsing         |
      | /experiments/voice/interaction             |
      | /experiments/voice/evaluation              |
      | /experiments/voice/roadmap                 |
      | /experiments/legacy                        |
      | /writing                                   |
      | /writing/publications                      |
      | /writing/blog                              |
      | /collaborate                               |

  Scenario: All images have appropriate alt text
    Given I am on the home page
    Then every image should have an alt attribute
    And decorative images should have an empty alt attribute or role presentation

  Scenario: Colour contrast meets WCAG AA on all text
    Given I am on the home page
    Then there should be no colour contrast violations

  Scenario: Keyboard focus order follows visual reading order
    Given I am on the home page
    When I navigate through the page using the Tab key
    Then focus should move in a logical top-to-bottom left-to-right order

  Scenario: Interactive elements are reachable by keyboard
    Given I am on the "/experiments/voice/grid/live" page
    Then all interactive controls should be reachable and operable by keyboard alone
