Feature: CMS publishing workflow
  As a content author
  I want a clear Draft / In Review / Published / Archived workflow
  So that I can control what visitors see without deleting content

  Background:
    Given I am logged in as the seeded admin user

  Scenario: Draft experiment is not visible to anonymous visitors
    Given an Experiment exists with status "draft"
    When an anonymous visitor navigates to the experiments listing
    Then that experiment should not appear in the listing

  Scenario: Published experiment is visible to anonymous visitors
    Given an Experiment exists with status "published"
    When an anonymous visitor navigates to the experiments listing
    Then that experiment should appear in the listing

  Scenario: Archived experiment is not visible to anonymous visitors
    Given an Experiment exists with status "archived"
    When an anonymous visitor navigates to the experiments listing
    Then that experiment should not appear in the listing

  Scenario: In Review experiment is not visible to anonymous visitors
    Given an Experiment exists with status "in-review"
    When an anonymous visitor navigates to the experiments listing
    Then that experiment should not appear in the listing

  Scenario: Admin can transition an experiment from Draft to Published
    Given an Experiment exists with status "draft"
    When I change its status to "published" and save
    Then an anonymous visitor should be able to see it in the listing

  Scenario: Admin can archive a published experiment
    Given an Experiment exists with status "published"
    When I change its status to "archived" and save
    Then an anonymous visitor should no longer see it in the listing
