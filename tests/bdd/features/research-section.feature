Feature: Research section
  As a researcher or practitioner
  I want to explore the EMI research themes and reference material
  So that I can understand the intellectual context behind the experiments

  Scenario: Research parent page lists all sub-sections
    Given I am on the "/research" page
    Then I should see a link to "DCH Users"
    And I should see a link to "Generous and Rich-prospect"
    And I should see a link to "AI-supported Exploration"
    And I should see a link to "Evaluation and User Categories"
    And I should see a link to "Limitations of Browsing"

  Scenario: DCH Users page renders
    Given I am on the "/research/dch-users" page
    Then the page should have a heading "DCH Users"
    And I should see a link to the Casual Users sub-page

  Scenario: Casual Users sub-page renders
    Given I am on the "/research/dch-users/casual-users" page
    Then the page should have a heading "Casual Users"

  Scenario: Generous and Rich-prospect page renders
    Given I am on the "/research/generous-and-rich-prospect" page
    Then the page should have a heading containing "Generous"

  Scenario: AI-supported Exploration page renders
    Given I am on the "/research/ai-supported-exploration" page
    Then the page should have a heading containing "AI"

  Scenario: Evaluation and User Categories page renders
    Given I am on the "/research/evaluation-and-user-categories" page
    Then the page should have a heading containing "Evaluation"

  Scenario: Limitations of Browsing reference page renders with numbered sections
    Given I am on the "/research/limitations-of-browsing" page
    Then the page should have a heading containing "Limitations"
    And I should see a numbered reference list

  Scenario: Limitations of Browsing reference list links to DOIs where available
    Given I am on the "/research/limitations-of-browsing" page
    Then at least one reference should contain a link to "doi.org"

  Scenario: Research section pages pass accessibility check
    Given I am on the "/research" page
    Then the page should have no axe violations at severity serious or above
