Feature: Docker stack boot
  As a developer
  I want the full Docker stack to start cleanly from a fresh clone
  So that local development setup is reliable and reproducible

  Scenario: Stack starts and all services report healthy within 2 minutes
    Given I have cloned the repository and created .env.local from .env.example
    When I run "docker compose --env-file .env.local -f docker-compose.yml -f docker-compose.dev.yml up --build"
    Then the "db" container should be healthy within 120 seconds
    And the "cms" container should be healthy within 120 seconds
    And the "web" container should be healthy within 120 seconds

  Scenario: CMS health endpoint responds
    Given the Docker stack is running
    When I request the CMS health endpoint at "http://localhost:1337/_health"
    Then the response status should be 200

  Scenario: Web health endpoint responds
    Given the Docker stack is running
    When I request the web health endpoint at "http://localhost:3000/api/health"
    Then the response status should be 200

  Scenario: CMS admin UI is reachable
    Given the Docker stack is running
    When I request "http://localhost:1337/admin"
    Then the response status should be 200

  Scenario: Stack rebuilds cleanly after a docker compose down
    Given the Docker stack has been brought down with "docker compose down"
    When I run the stack again with "docker compose up --build"
    Then all services should reach healthy status within 120 seconds
