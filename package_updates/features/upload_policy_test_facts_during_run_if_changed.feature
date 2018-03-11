Feature: Upload Policy Test Facts If Changed
  As a security engineer
  I want new or changed policies to update as soon as possible
  so that I can trust my policy information is always up to date

  Scenario: A test is created
    Given a policy test named 'test_name' is declared
    And the policy test does not exist on the node
    When puppet runs
    Then the policy test should exist
    And the test should be updated after the run

  Scenario: A test is updated
    Given a policy test named 'test_name' is declared
    And the policy test exists on the node
    When puppet runs
    Then the policy test should exist
    And the test should be updated after the run
