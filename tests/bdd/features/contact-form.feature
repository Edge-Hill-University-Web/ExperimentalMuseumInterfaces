Feature: Contact form
  As a potential partner or participant
  I want to submit a contact enquiry
  So that the EMI team can follow up with me

  Background:
    Given I am on the "/collaborate" page

  Scenario: Contact form accepts a valid submission
    When I fill in the contact form with valid details
    And I submit the form
    Then I should see a confirmation message
    And a ContactLead record should be created in the CMS

  Scenario: Contact form rejects a submission with a missing required field
    When I submit the contact form without an email address
    Then I should see a validation error on the email field

  Scenario: Contact form rejects a submission with an invalid email address
    When I submit the contact form with "not-an-email" as the email address
    Then I should see a validation error on the email field

  Scenario: Contact form rejects a honeypot-triggered submission
    When I submit the contact form with the honeypot field filled in
    Then the submission should be silently rejected
    And no ContactLead record should be created

  Scenario: Contact form rate-limits duplicate submissions
    When I submit the same valid contact form twice within 60 seconds
    Then the second submission should be rejected with a rate-limit message

  Scenario: Submitter receives a confirmation email
    When I fill in the contact form with valid details including my email
    And I submit the form
    Then a confirmation email should be sent to my email address

  Scenario: EMI team receives a notification email
    When I fill in the contact form with valid details
    And I submit the form
    Then a notification email should be sent to walshd@edgehill.ac.uk
