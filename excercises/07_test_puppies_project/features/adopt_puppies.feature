Feature: Adopt a puppy
  As a puppy lover
  I want to adopt a puppy
  So that I can give a puppy a better life

  Scenario: User views a puppies details
    Given I am looking for a puppy
    When I view the details puppy 1
    Then I should see details for "Brook"

  Scenario: Adopt the first puppy
    Given I am looking for a puppy
    When I view the details puppy 1
    Then I should see details for "Brook"
    And I adopt the puppy
    And I complete the adoption
    And I enter "Pat Kelly" as the name
    And I enter "123 Main St." as the address
    And I enter "jus.beall@gmail.com" as the email
    And I select "Check" as the payment type
    And I complete the order
    Then I should see the message "Thank you for adopting a puppy!"