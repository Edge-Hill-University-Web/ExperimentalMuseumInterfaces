Feature: Legacy URL redirects
  As a visitor using an old bookmarked or linked URL
  I want to be redirected automatically to the correct new page
  So that no links break when the site is rebuilt

  Scenario: Misspelled experiments path redirects to correct path
    When I visit "/experiements"
    Then I should be redirected to "/experiments" with a 301 status

  Scenario: Misspelled experiments sub-path redirects correctly
    When I visit "/experiements/collectionexplorer.html"
    Then I should be redirected with a 301 status

  Scenario: about.html redirects to the new about route
    When I visit "/about.html"
    Then I should be redirected to "/about" with a 301 status

  Scenario: experiments.html redirects to the new experiments route
    When I visit "/experiments.html"
    Then I should be redirected to "/experiments" with a 301 status

  Scenario: literature.html redirects to the generous-and-rich-prospect research page
    When I visit "/literature.html"
    Then I should be redirected to "/research/generous-and-rich-prospect" with a 301 status

  Scenario: Home URL continues to resolve at root
    When I visit "/"
    Then the response status should be 200
