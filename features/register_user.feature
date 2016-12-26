Feature: Register a new user

  As a visitor
  So that I have access to the application
  I want to register myself to be a new user

  Background:
  Given the following agencies exist:
    | name        | phone        |
    | disney land | 123-000-0000 |

  Scenario: Register as a tourist
    Given I am on the main page
    And I click the "Sign Up" link
    Then I should see "Sign Up" form
    And I fill in "user[email]" with "tom_seeker@gmail.com"
    And I fill in "user[password]" with "qwerty123"
    And I fill in "user[password_confirmation]" with "qwerty123"
    And I check "Tourist"
    And I click the "Sign Up" button
    Then I should see "Welcome! You have signed up successfully."
    Then I should see "Tourist"

  Scenario: Register as a tour guide and Translator
    Given I am on the main page
    And I click the "Sign Up" link
    Then I should see "Sign Up" form
    And I fill in "user[email]" with "tom_seeker@gmail.com"
    And I fill in "user[password]" with "qwerty123"
    And I fill in "user[password_confirmation]" with "qwerty123"
    And I check "Tour Guide"
    And I check "Translator"
    And I click the "Sign Up" button
    Then I should see "Welcome! You have signed up successfully."
    Then I should see "Agency Person"
