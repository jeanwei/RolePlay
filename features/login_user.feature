Feature: Login and logout as an existing user

  As a registered user
  So that I have access to the application
  I want to login to my account

Background:
  Given the following agencies exist:
    | name        | phone        |
    | disney land | 123-000-0000 |

  Given the following tour guide exist:
    | agency      | email                 |
    | disney land | alice@disneyland.com  |

  Given the following tourists exist:
    | email                  |
    | tom_seeker@gmail.com   |

  Scenario: Login and Logout as a tourist
    Given I am on the main page
    And I click the "Log In" link
    Then I should see "Log In" form
    And I fill in "user[email]" with "tom_seeker@gmail.com"
    And I fill in "user[password]" with "qwerty123"
    And I click the "Log In" button
    Then I should see "Signed in successfully."
    And I click the "Log Out" link
    Then I should see "Signed out successfully."

  Scenario: Login and logout as an agency person
    Given I am on the main page
    And I click the "Log In" link
    Then I should see "Log In" form
    And I fill in "user[email]" with "alice@disneyland.com"
    And I fill in "user[password]" with "qwerty123"
    And I click the "Log In" button
    Then I should see "Signed in successfully."
    And I click the "Log Out" link
    Then I should see "Signed out successfully."

