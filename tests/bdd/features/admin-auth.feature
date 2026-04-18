Feature: CMS admin authentication
  As the site administrator
  I want to log in to the Strapi admin panel securely
  So that I can manage content

  Background:
    Given I am on the "/admin" page of the CMS at port 1337

  Scenario: Seeded admin user can log in with correct credentials
    When I enter the seeded admin email and password
    And I submit the login form
    Then I should be redirected to the CMS dashboard

  Scenario: Login with incorrect password is rejected
    When I enter the seeded admin email and an incorrect password
    And I submit the login form
    Then I should see an error message
    And the error message should not reveal whether the email exists

  Scenario: Login with correct email but whitespace-trimmed password fails
    When I enter the seeded admin email and the password with leading whitespace removed
    And I submit the login form
    Then I should see an error message

  Scenario: Admin can access Experiments content type after login
    Given I am logged in as the seeded admin user
    Then I should be able to navigate to the Experiments collection in the CMS

  Scenario: Admin can access all required content type collections after login
    Given I am logged in as the seeded admin user
    Then I should see collections for "Experiments", "Publications", "Essays", "Team Members", and "Contact Leads"

  Scenario: Account is locked after repeated failed attempts
    When I submit incorrect credentials 10 times in a row from the same IP
    Then further login attempts should be rejected without checking credentials
