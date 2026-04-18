Feature: Legacy interface reconstructions
  As a researcher or practitioner
  I want to explore reconstructions of historically important interfaces
  So that I can understand their original design and the EMI approximation

  Scenario: Legacy index page renders
    Given I am on the "/experiments/legacy" page
    Then the page should have a heading containing "Legacy"
    And I should see at least one interface reconstruction listed

  Scenario: Legacy detail page renders for a published reconstruction
    Given a legacy interface reconstruction exists with slug "collection-explorer"
    When I am on the "/experiments/legacy/collection-explorer" page
    Then the page should have a heading for the reconstruction

  Scenario: Legacy detail page names original authors
    Given I am on the "/experiments/legacy/collection-explorer" page
    Then I should see the original authors listed

  Scenario: Legacy detail page names original institution
    Then I should see the original institution listed

  Scenario: Legacy detail page names original dataset
    Then I should see the original dataset listed

  Scenario: Legacy detail page cites the original publication
    Then I should see a citation linking to the original publication

  Scenario: Legacy approximation is clearly labelled
    Then I should see text indicating this is a contemporary approximation, not a replication

  Scenario: Legacy detail page passes accessibility check
    Given I am on the "/experiments/legacy" page
    Then the page should have no axe violations at severity serious or above
