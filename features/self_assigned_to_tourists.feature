Feature: Self assigned to tourists
  As a tour guide
  I would like to assign myself to a tourist

  Background:
  Given the following agencies exist:
    | name        | phone        |
    | disney land | 123-000-0000 |

  Given the following agency people exist:
    | agency      | email                 | roles                  |
    | disney land | alice@disneyland.com  | Tour Guide, Translator |
    | disney land | mulan@disneyland.com  | Tour Guide             |

  Given the following tourists exist:
    | email                  |
    | tom@gmail.com          |
    | jerry@gmail.com        |
    | goofy@gmail.com        |

  Scenario: Self-assigned to be a tour guide
    Given I am on the main page
    And I login as "mulan@disneyland.com" 
    Then I should see "tom@gmail.com"
    Then I should see "jerry@gmail.com"
    And I should see "Be Tour Guide"
    And I should not see "Be Translator"
    And I click the first "Be Tour Guide" link
    Then I should see "mulan@disneyland.com" after "tourist:tom@gmail.com"

  Scenario: Self-assigned to be a tour guide and translator
    Given I am on the main page
    And I login as "alice@disneyland.com" 
    Then I should see "tom@gmail.com"
    Then I should see "jerry@gmail.com"
    And I click the first "Be Tour Guide" link
    And I click the second "Be Translator" link
    Then I should see "alice@disneyland.com" after "tourist:tom@gmail.com"
    Then I should see "alice@disneyland.com" after "tourist:jerry@gmail.com"
    
