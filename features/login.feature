Feature: Admin login

  As an Administrator
  I want to create users
  So that developers can test their WSDL
  
  Scenario: successful admin login
    Given I am an admin
    And I am on the login page
    When I login with valid credentials
    Then I should be on the home page
    And I should see "Successfully logged in."
  
  Scenario: admin should see user list
    Given I am an admin
    And I am on the home page
    When I login with valid credentials
    Then I should see "Users"
    
  Scenario: admin creates a new user
    Given I am a logged in admin
    And I am on the create user page
    When I fill in the following:        
      | Username              | user_2              | 
      | Email                 | user2@email.com     |
      | Password              | asdf                |
      | Password confirmation | asdf                |
    And I press "Submit"
    Then I should be on the users page
    And I should see "user_2"
    And I should see "User successfully created."

  Scenario: admin edits a user
    Given I am a logged in admin
    And "user_1" exists
    And I am on the users page
    When I follow "user_1"
    Then I should be on the edit "user_1" page
    
  Scenario: admin edits user's email
    Given I am a logged in admin
    And "user_2" exists
    And I am on the edit "user_2" page
    When I fill in the following:
      | Username              | user_2                    | 
      | Email                 | user2changed@email.com    |
      | Password              | asdf                      |
      | Password confirmation | asdf                      |
    And I press "Submit"
    Then "user_2"'s email should be "user2changed@email.com"
    And I should be on the users page
    And I should see "User successfully updated."