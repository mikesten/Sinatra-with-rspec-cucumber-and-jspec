Feature: Testing stuff
  Background:
    Given there is a projects API
 
  Scenario: Vanilla get
    When I am on the home page
    Then it should greet me
  Scenario: Net request
    When I am on the projects page
    Then it should show a project
