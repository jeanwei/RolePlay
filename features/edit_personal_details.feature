Feature: Edit personal details

  As a tourist
  So that my personal details are up-to-date
  I would like to edit them

  Background:
  Given the following tourists exist:
    | email                  |
    | tom_seeker@gmail.com   |

  Scenario: Edit as a tourist
    Given I am on the main page
    And I login as "tom_seeker@gmail.com"
    And I click the "Edit Profile" link
    Then I should see "Edit Profile" form
    And I select "1990" in select list "Year Of Birth"
    And I click the "Update" button
    Then I should see "Tourist"
    Then I should see "1990"
