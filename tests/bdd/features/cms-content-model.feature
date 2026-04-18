Feature: CMS content model
  As an administrator
  I want all required content types to exist with the correct fields and validation
  So that I can author and manage all site content through the CMS

  Background:
    Given I am logged in as the seeded admin user

  Scenario Outline: Required content types exist in the CMS
    When I navigate to the "<contentType>" collection
    Then the collection should exist and be accessible
    Examples:
      | contentType      |
      | Experiment       |
      | Project          |
      | ResearchStudy    |
      | Publication      |
      | Essay            |
      | Talk             |
      | PressMention     |
      | Partner          |
      | Dataset          |
      | TeamMember       |
      | ResearchThread   |
      | LegacyInterface  |
      | VoicePrototype   |
      | ContactLead      |

  Scenario: Experiment content type has required fields
    When I view the Experiment content type schema
    Then it should have fields: title, slug, status, shortDescription, fullDescription, heroImage, publishedAt

  Scenario: Experiment status field only accepts valid values
    When I create an Experiment with status "invalid-status"
    Then the CMS should reject it with a validation error

  Scenario: Experiment with empty title is rejected
    When I create an Experiment with an empty title
    Then the CMS should reject it with a validation error

  Scenario: Publication content type has required fields
    When I view the Publication content type schema
    Then it should have fields: title, authors, venue, year, doi, url, abstract, bibtex

  Scenario: VoicePrototype content type has required fields
    When I view the VoicePrototype content type schema
    Then it should have fields: name, slug, description, commandGrammar, demoVideoUrl, evaluation

  Scenario: LegacyInterface content type has required fields
    When I view the LegacyInterface content type schema
    Then it should have fields: title, originalAuthors, originalInstitution, originalDataset, originalPublication

  Scenario: ContactLead content type has required fields
    When I view the ContactLead content type schema
    Then it should have fields: organisation, contactName, email, topic, message, submittedAt
