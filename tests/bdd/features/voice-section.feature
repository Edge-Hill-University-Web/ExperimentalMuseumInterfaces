Feature: Voice specialised thread
  As a researcher or participant
  I want to explore the voice-controlled browsing work
  So that I can understand, evaluate, and participate in the research

  Scenario: Voice overview page renders with philosophy statement
    Given I am on the "/experiments/voice/overview" page
    Then the page should have a heading containing "Voice"
    And I should see a description of the voice browsing research philosophy

  Scenario: Voice-Controlled Grid page renders
    Given I am on the "/experiments/voice/grid" page
    Then the page should have a heading containing "Voice-Controlled Grid"
    And I should see a link to the live grid experiment

  Scenario: Live grid research experiment page renders
    Given I am on the "/experiments/voice/grid/live" page
    Then the page should have a heading containing "Live"
    And I should see the voice grid interface embed or component

  Scenario: Live grid page includes an AI disclosure panel
    Given I am on the "/experiments/voice/grid/live" page
    Then I should see an AI disclosure panel

  Scenario: Live grid has a keyboard fallback for every voice command
    Given I am on the "/experiments/voice/grid/live" page
    Then I should see keyboard controls that replicate all voice commands

  Scenario: Voice-Driven Browsing page renders
    Given I am on the "/experiments/voice/driven-browsing" page
    Then the page should have a heading containing "Voice-Driven Browsing"

  Scenario: Voice Interaction page renders
    Given I am on the "/experiments/voice/interaction" page
    Then the page should have a heading containing "Voice"

  Scenario: Voice Evaluation and Protocols page renders
    Given I am on the "/experiments/voice/evaluation" page
    Then the page should have a heading containing "Evaluation"
    And I should see the evaluation protocol described

  Scenario: Voice Roadmap page renders
    Given I am on the "/experiments/voice/roadmap" page
    Then the page should have a heading containing "Roadmap"

  Scenario: All voice pages pass accessibility check
    Given I am on the "/experiments/voice/overview" page
    Then the page should have no axe violations at severity serious or above
