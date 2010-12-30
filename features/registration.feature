Feature: User Login

  As a User
  I want to be able to create an account
  So that I can use the site
  
  Scenario: Unauthenticated users goes to the home page
    Given I am an unauthenticated user
    When I go to the home page
    Then I should see "Please Register"
  
